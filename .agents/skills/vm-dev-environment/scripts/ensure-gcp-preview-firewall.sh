#!/usr/bin/env bash
# Configure the dedicated public prototype-preview firewall rule for one existing VM.
set -euo pipefail

project=""
zone=""
instance=""
network="default"
rule="codex-workshop-preview-tcp"
tag="codex-workshop-preview"
apply=false

usage() {
  cat <<'EOF'
Usage: ensure-gcp-preview-firewall.sh --project PROJECT_ID --zone ZONE --instance VM_NAME [options]

Options:
  --network NETWORK  VPC network name (default: default)
  --rule NAME        Dedicated firewall-rule name (default: codex-workshop-preview-tcp)
  --tag TAG          VM network tag (default: codex-workshop-preview)
  --apply            Apply changes. Without it, print the plan only.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) project="${2:?missing project value}"; shift 2 ;;
    --zone) zone="${2:?missing zone value}"; shift 2 ;;
    --instance) instance="${2:?missing instance value}"; shift 2 ;;
    --network) network="${2:?missing network value}"; shift 2 ;;
    --rule) rule="${2:?missing rule value}"; shift 2 ;;
    --tag) tag="${2:?missing tag value}"; shift 2 ;;
    --apply) apply=true; shift ;;
    --help|-h) usage; exit 0 ;;
    *) usage >&2; exit 2 ;;
  esac
done

if [[ -z "$project" || -z "$zone" || -z "$instance" ]]; then
  usage >&2
  exit 2
fi

command -v gcloud >/dev/null || {
  printf '%s\n' "gcloud is required on the infrastructure creator's machine." >&2
  exit 1
}

printf '%s\n' "Preview firewall plan:"
printf '  Tag VM %q in project %q, zone %q with %q.\n' "$instance" "$project" "$zone" "$tag"
printf '  Create or update firewall rule %q on network %q.\n' "$rule" "$network"
printf '  Allow public ingress from 0.0.0.0/0 to TCP ports 3000-3999 for tag %q.\n' "$tag"

if ! "$apply"; then
  printf '%s\n' "Dry run complete. Re-run with --apply to change the existing VM and its dedicated preview firewall rule."
  exit 0
fi

gcloud compute instances describe "$instance" --project "$project" --zone "$zone" >/dev/null
gcloud compute instances add-tags "$instance" --project "$project" --zone "$zone" --tags "$tag" --quiet

if gcloud compute firewall-rules describe "$rule" --project "$project" >/dev/null 2>&1; then
  gcloud compute firewall-rules update "$rule" \
    --project "$project" \
    --allow tcp:3000-3999 \
    --source-ranges 0.0.0.0/0 \
    --target-tags "$tag" \
    --quiet
else
  gcloud compute firewall-rules create "$rule" \
    --project "$project" \
    --network "$network" \
    --direction INGRESS \
    --allow tcp:3000-3999 \
    --source-ranges 0.0.0.0/0 \
    --target-tags "$tag" \
    --description "Public workshop prototype previews on TCP 3000-3999." \
    --quiet
fi

gcloud compute firewall-rules describe "$rule" --project "$project" \
  --format="table(name,network,allowed,sourceRanges,targetTags,disabled)"
printf '%s\n' "Public preview firewall rule applied. No user credentials were changed."
