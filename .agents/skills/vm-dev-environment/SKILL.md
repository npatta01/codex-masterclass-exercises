---
name: vm-dev-environment
description: Use when the workshop infrastructure creator needs to plan, create, or maintain the repository's shared Google Cloud Ubuntu development VM and its public prototype-preview range.
---

# Create the Workshop Development VM

This repository skill is the canonical VM setup for the workshop. It is for
the infrastructure creator, who runs it before participants arrive. The
default Google Compute Engine VM is sized for 10 concurrent participants:

- project `np-codex-workshop`, VM `codex-vm`, zone `us-east4-c`
- Ubuntu 24.04 LTS on `e2-standard-16` (16 vCPUs, 64 GB RAM)
- 200 GB `pd-balanced` boot disk and an ephemeral external IPv4 address
- Google Cloud OS Login for separate participant Linux identities
- public prototype previews on TCP 3000-3999

The script does not create static `participant01`-style accounts. Participants
already granted access to the project connect with `gcloud compute ssh`; OS
Login maps each Google identity to its own Linux account.

## Required access

The creator must already be authenticated with `gcloud` and have permission to
inspect the project, enable `compute.googleapis.com`, create/read Compute
Engine instances and disks, and create/update the dedicated firewall rule.
They also need permission to connect through OS Login and IAP, and to use the
VM's service account when applicable.

Use this least-privilege participant access model:

- Grant `roles/compute.osLogin` on the project. This permits a standard Linux
  login and does not grant `sudo`.
- Grant `roles/iap.tunnelResourceAccessor` on the project for IAP SSH.
- Because the workshop VM retains its Compute Engine service account, grant
  `roles/iam.serviceAccountUser` only on that specific service account.
- Do not grant participants `roles/compute.osAdminLogin`, `roles/owner`,
  `roles/editor`, `roles/iap.admin`, `roles/iap.policyAdmin`, or
  `roles/compute.instanceAdmin.v1`.

Keep the attached service account free of broad project roles such as Editor;
otherwise a participant allowed to use it could inherit those permissions.
IAP also needs a VPC rule permitting TCP 22 from Google's IAP range
`35.235.240.0/20`. This skill does not create or broaden an SSH firewall rule.
External identities may additionally require
`roles/compute.osLoginExternalUser` on the organization. Keep grants per
person; never share credentials or SSH keys. See
[`docs/workshop-vm-access.md`](../../../docs/workshop-vm-access.md) for the
auditable role matrix and commands.

## Resources and safety boundary

The apply workflow may enable the Compute Engine API, create one named VM, and
create or update one dedicated ingress firewall rule targeting only the
configured network tag. It never changes unrelated firewall rules or opens
all ports. Existing named VMs are inspected and reused only when compatible;
the script never silently replaces or deletes them.

Public TCP 3000-3999 is reachable from `0.0.0.0/0`. Any process bound to
`0.0.0.0` in that range is therefore internet-accessible. Do not serve secrets
or sensitive data, and stop previews after use. Costs vary by zone and running
time; the VM and 200 GB disk continue accruing charges while retained.

## Run

Review the complete proposal without changing Google Cloud:

```bash
.agents/skills/vm-dev-environment/scripts/create-gcp-workshop-vm.sh \
  --dry-run
```

After the creator explicitly authorizes the displayed configuration, apply it:

```bash
.agents/skills/vm-dev-environment/scripts/create-gcp-workshop-vm.sh \
  --apply
```

These commands default to project `np-codex-workshop`, VM `codex-vm`, and zone
`us-east4-c`. Run `scripts/create-gcp-workshop-vm.sh --help` for overrides. The helper waits
for SSH, transfers `provision-ubuntu-dev-tools.sh`, and installs shared Git,
Python, uv, Node/npm, GitHub CLI, Google Cloud CLI, and Codex binaries. It does
not authenticate participants.

## Participant access and authentication

Each participant authenticates `gcloud` on their own computer, selects the
workshop project, and connects through IAP:

```bash
gcloud auth login
gcloud config set project np-codex-workshop
gcloud compute ssh codex-vm \
  --project=np-codex-workshop \
  --zone=us-east4-c \
  --tunnel-through-iap
```

Inside their own OS Login account, each participant separately runs only the
sign-ins they need:

```bash
gh auth login
gcloud auth login
codex login --device-auth
```

Never share credentials, tokens, SSH keys, device codes, `auth.json`, or
browser profiles. Never pre-authenticate accounts or store credentials in VM
metadata, startup scripts, images, or repository files. Software provisioning
may occur during setup; authentication must not run during creation, startup,
or provisioning.

OS Login derives a different Linux account from each participant's Google
identity. A participant granted only `roles/compute.osLogin` cannot use OS
Login to obtain `sudo` and does not log in as the infrastructure creator.

For previews, Codex selects an unused port in 3000-3999, binds the development
server to `0.0.0.0`, keeps it running until intentionally stopped, and reports
`http://VM_EXTERNAL_IP:SELECTED_PORT`. Codex never changes the firewall.

## After the workshop

Stop the VM to stop compute charges while retaining its disk:

```bash
gcloud compute instances stop VM_NAME --project PROJECT_ID --zone ZONE
```

Deleting the VM or firewall rule is destructive and is outside this skill's
apply workflow. Do it only after the infrastructure creator explicitly
confirms the exact project, zone, VM, and firewall-rule names. A typical
confirmed cleanup uses `gcloud compute instances delete` followed by
`gcloud compute firewall-rules delete`; deletion cannot be inferred from a
request merely to stop or finish the workshop.
