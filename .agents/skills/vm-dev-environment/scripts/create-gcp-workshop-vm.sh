#!/usr/bin/env bash
# Create and provision the shared Google Cloud workshop VM. Dry-run is the default.
set -euo pipefail

project="np-codex-workshop"
zone="us-east4-c"
vm_name="codex-vm"
machine_type="e2-standard-16"
disk_size="200"
disk_type="pd-balanced"
image_family="ubuntu-2404-lts-amd64"
image_project="ubuntu-os-cloud"
network="default"
network_tag="codex-workshop-preview"
firewall_rule="codex-workshop-preview-tcp"
apply=false

usage() {
  cat <<'EOF'
Usage: create-gcp-workshop-vm.sh [options]

Options:
  --project PROJECT_ID       Google Cloud project (default: np-codex-workshop)
  --zone ZONE                Compute Engine zone (default: us-east4-c)
  --name NAME                VM name (default: codex-vm)
  --machine-type TYPE        Machine type (default: e2-standard-16)
  --disk-size GB             Boot disk size in GB (default: 200)
  --network NETWORK          VPC network (default: default)
  --firewall-rule NAME       Dedicated preview rule (default: codex-workshop-preview-tcp)
  --network-tag TAG          Dedicated VM target tag (default: codex-workshop-preview)
  --dry-run                  Print and validate the proposal without changes (default)
  --apply                    Create/configure resources and provision the VM
  --help                     Show this help

The image is Ubuntu 24.04 LTS, the disk type is pd-balanced, OS Login is
enabled, and public prototype previews are limited to TCP 3000-3999.
Participant Linux identities come from Google Cloud OS Login; this script does
not create static participant accounts or passwords.
EOF
}

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

require_value() {
  [[ $# -ge 2 && -n "$2" && "$2" != --* ]] || die "$1 requires a value."
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) require_value "$@"; project="$2"; shift 2 ;;
    --zone) require_value "$@"; zone="$2"; shift 2 ;;
    --name|--vm-name) require_value "$@"; vm_name="$2"; shift 2 ;;
    --machine-type) require_value "$@"; machine_type="$2"; shift 2 ;;
    --disk-size) require_value "$@"; disk_size="$2"; shift 2 ;;
    --network) require_value "$@"; network="$2"; shift 2 ;;
    --firewall-rule) require_value "$@"; firewall_rule="$2"; shift 2 ;;
    --network-tag) require_value "$@"; network_tag="$2"; shift 2 ;;
    --dry-run) apply=false; shift ;;
    --apply) apply=true; shift ;;
    --help|-h) usage; exit 0 ;;
    *) usage >&2; die "unknown argument: $1" ;;
  esac
done

[[ "$disk_size" =~ ^[1-9][0-9]*$ ]] || die "--disk-size must be a positive integer."
command -v gcloud >/dev/null 2>&1 || die "gcloud is required on the infrastructure creator's machine."

active_account="$(gcloud auth list --filter=status:ACTIVE '--format=value(account)' --limit=1)"
[[ -n "$active_account" ]] || die "no active gcloud account; authenticate the infrastructure creator first."
gcloud projects describe "$project" '--format=value(projectId)' >/dev/null || \
  die "active account $active_account cannot access project $project."

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
provisioner="$script_dir/provision-ubuntu-dev-tools.sh"
[[ -r "$provisioner" ]] || die "provisioner not found: $provisioner"

participant_ssh="gcloud compute ssh $vm_name --project $project --zone $zone --tunnel-through-iap"

print_configuration() {
  printf '%s\n' \
    "Workshop VM configuration" \
    "  Mode: $([[ "$apply" == true ]] && printf apply || printf dry-run)" \
    "  Project: $project" \
    "  Zone: $zone" \
    "  VM name: $vm_name" \
    "  Machine type: $machine_type" \
    "  Boot disk: $disk_size GB $disk_type" \
    "  Image: $image_project/$image_family" \
    "  Network: $network" \
    "  External IPv4: ephemeral" \
    "  Network tag: $network_tag" \
    "  Firewall rule: $firewall_rule" \
    "  Preview ports: tcp:3000-3999 from 0.0.0.0/0" \
    "  Workshop capacity: 10 concurrent participants" \
    "  Account model: Google Cloud OS Login" \
    "  Participant SSH: $participant_ssh"
}

print_configuration

compute_enabled="$(gcloud services list \
  --project "$project" \
  --enabled \
  --filter=config.name:compute.googleapis.com \
  '--format=value(config.name)')"

instance_exists=false
if gcloud compute instances describe "$vm_name" --project "$project" --zone "$zone" >/dev/null 2>&1; then
  instance_exists=true
fi

if ! "$apply"; then
  [[ -n "$compute_enabled" ]] || printf '%s\n' "Plan: enable compute.googleapis.com."
  if "$instance_exists"; then
    printf '%s\n' "Plan: inspect the existing named VM and stop if any requested setting is incompatible."
  else
    printf '%s\n' "Plan: create the VM with OS Login, an external IPv4 address, and only the dedicated preview tag."
  fi
  printf '%s\n' \
    "Plan: create or update only firewall rule $firewall_rule for tcp:3000-3999 and target tag $network_tag." \
    "Plan: wait for Google Compute Engine SSH, transfer the repository provisioner, and install shared tools." \
    "Plan: do not create participant accounts, passwords, credentials, startup authentication, or a public TCP 22 rule." \
    "No cloud resources or software were changed."
  exit 0
fi

if [[ -z "$compute_enabled" ]]; then
  gcloud services enable compute.googleapis.com --project "$project"
fi

assert_existing_vm_compatible() {
  local actual_machine actual_network actual_tags actual_nat_ip actual_oslogin
  local disk_uri disk_name actual_disk_size actual_disk_type actual_disk_licenses

  actual_machine="$(gcloud compute instances describe "$vm_name" --project "$project" --zone "$zone" --format='value(machineType.basename())')"
  actual_network="$(gcloud compute instances describe "$vm_name" --project "$project" --zone "$zone" --format='value(networkInterfaces[0].network.basename())')"
  actual_tags="$(gcloud compute instances describe "$vm_name" --project "$project" --zone "$zone" --format='value(tags.items)')"
  actual_nat_ip="$(gcloud compute instances describe "$vm_name" --project "$project" --zone "$zone" --format='value(networkInterfaces[0].accessConfigs[0].natIP)')"
  actual_oslogin="$(gcloud compute instances describe "$vm_name" --project "$project" --zone "$zone" --flatten='metadata.items[]' --filter='metadata.items.key=enable-oslogin' --format='value(metadata.items.value)')"
  disk_uri="$(gcloud compute instances describe "$vm_name" --project "$project" --zone "$zone" --format='value(disks[0].source)')"
  disk_name="${disk_uri##*/}"
  actual_disk_size="$(gcloud compute disks describe "$disk_name" --project "$project" --zone "$zone" --format='value(sizeGb)')"
  actual_disk_type="$(gcloud compute disks describe "$disk_name" --project "$project" --zone "$zone" --format='value(type.basename())')"
  actual_disk_licenses="$(gcloud compute disks describe "$disk_name" --project "$project" --zone "$zone" --format='value(licenses)')"

  [[ "$actual_machine" == "$machine_type" ]] || die "existing VM uses machine type $actual_machine, requested $machine_type; refusing to replace it."
  [[ "$actual_network" == "$network" ]] || die "existing VM uses network $actual_network, requested $network; refusing to replace it."
  actual_tags="${actual_tags//,/;}"
  actual_tags="${actual_tags// /;}"
  [[ ";$actual_tags;" == *";$network_tag;"* ]] || die "existing VM lacks dedicated network tag $network_tag; refusing to alter it silently."
  [[ -n "$actual_nat_ip" ]] || die "existing VM has no external IPv4 address; refusing to alter it silently."
  [[ "${actual_oslogin^^}" == "TRUE" ]] || die "existing VM does not enable OS Login; refusing to alter it silently."
  [[ "$actual_disk_size" == "$disk_size" ]] || die "existing VM boot disk is ${actual_disk_size} GB, requested ${disk_size} GB; refusing to replace it."
  [[ "$actual_disk_type" == "$disk_type" ]] || die "existing VM boot disk type is $actual_disk_type, requested $disk_type; refusing to replace it."
  [[ "$actual_disk_licenses" == *"ubuntu-2404-lts"* ]] || die "existing VM boot disk is not Ubuntu 24.04 LTS; refusing to replace it."
}

if "$instance_exists"; then
  assert_existing_vm_compatible
  printf '%s\n' "Existing VM $vm_name is compatible; preserving it."
else
  gcloud compute instances create "$vm_name" \
    --project "$project" \
    --zone "$zone" \
    --machine-type "$machine_type" \
    --boot-disk-size "${disk_size}GB" \
    --boot-disk-type "$disk_type" \
    --image-family "$image_family" \
    --image-project "$image_project" \
    --network "$network" \
    --tags "$network_tag" \
    --metadata enable-oslogin=TRUE
fi

if gcloud compute firewall-rules describe "$firewall_rule" --project "$project" >/dev/null 2>&1; then
  existing_firewall_network="$(gcloud compute firewall-rules describe "$firewall_rule" --project "$project" --format='value(network.basename())')"
  existing_firewall_direction="$(gcloud compute firewall-rules describe "$firewall_rule" --project "$project" --format='value(direction)')"
  [[ "$existing_firewall_network" == "$network" ]] || \
    die "existing firewall rule $firewall_rule belongs to network $existing_firewall_network, not $network."
  [[ "$existing_firewall_direction" == "INGRESS" ]] || \
    die "existing firewall rule $firewall_rule is $existing_firewall_direction, not INGRESS."
  gcloud compute firewall-rules update "$firewall_rule" \
    --project "$project" \
    --direction INGRESS \
    --allow tcp:3000-3999 \
    --source-ranges 0.0.0.0/0 \
    --target-tags "$network_tag" \
    --no-disabled \
    --quiet
else
  gcloud compute firewall-rules create "$firewall_rule" \
    --project "$project" \
    --network "$network" \
    --direction INGRESS \
    --allow tcp:3000-3999 \
    --source-ranges 0.0.0.0/0 \
    --target-tags "$network_tag" \
    --description "Public Codex workshop prototype previews on TCP 3000-3999." \
    --quiet
fi

printf '%s\n' "Waiting for $vm_name to accept Google Compute Engine SSH..."
ssh_ready=false
for attempt in $(seq 1 30); do
  if gcloud compute ssh "$vm_name" \
    --project "$project" \
    --zone "$zone" \
    --tunnel-through-iap \
    --command true \
    --quiet >/dev/null 2>&1; then
    ssh_ready=true
    break
  fi
  printf '  SSH attempt %s/30 not ready yet.\n' "$attempt"
  sleep 10
done
"$ssh_ready" || die "VM did not become reachable through gcloud compute ssh."

remote_provisioner="/tmp/codex-workshop-provision-ubuntu-dev-tools.sh"
gcloud compute scp "$provisioner" "${vm_name}:${remote_provisioner}" \
  --project "$project" \
  --zone "$zone" \
  --tunnel-through-iap \
  --quiet
gcloud compute ssh "$vm_name" \
  --project "$project" \
  --zone "$zone" \
  --tunnel-through-iap \
  --command "sudo bash '$remote_provisioner' && rm -f '$remote_provisioner'" \
  --quiet

external_ip="$(gcloud compute instances describe "$vm_name" \
  --project "$project" \
  --zone "$zone" \
  --format='value(networkInterfaces[0].accessConfigs[0].natIP)')"

printf '%s\n' \
  "Workshop VM ready" \
  "  VM name: $vm_name" \
  "  Project: $project" \
  "  Zone: $zone" \
  "  Machine type: $machine_type" \
  "  External IP: $external_ip" \
  "  Preview ports: tcp:3000-3999" \
  "  Account model: Google Cloud OS Login (one Linux identity per authorized Google user)" \
  "  Participant SSH: $participant_ssh" \
  "  After connecting, each participant authenticates gh, gcloud, and Codex only within their own account."

printf '%s\n' "Installed tool versions:"
gcloud compute ssh "$vm_name" \
  --project "$project" \
  --zone "$zone" \
  --tunnel-through-iap \
  --command "git --version; python3 --version; pip3 --version; uv --version; node --version; npm --version; gh --version | head -n 1; gcloud --version | head -n 1; codex --version" \
  --quiet
