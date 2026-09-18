---
name: vm-dev-environment
description: Use when the workshop infrastructure creator needs to provision a shared Ubuntu LTS development VM with common command-line tools or enable its public prototype-preview firewall range.
---

# Provision an Ubuntu Development VM

Use this project skill only for workshop infrastructure. It prepares a shared
Ubuntu LTS VM for development; it is not a developer workstation setup.

## Safety boundary

Install shared tools only: Git, Python 3 (including venv and pip), uv in
`/usr/local/bin`, Node.js 22/npm from NodeSource, GitHub CLI, Google Cloud CLI,
and Codex. Never authenticate workshop users. Do not run `gh auth login`,
`gcloud auth login`, or `codex login`; do not copy, accept, log, or handle
credentials, tokens, SSH keys, device codes, browser profiles, or `auth.json`.

The shared uv executable is global, while each user's uv cache, Python
installations, and project environments remain under that user's account.

## Install shared tools

1. Confirm that the target is an Ubuntu LTS VM and that the requester is the
   authorized infrastructure creator.
2. From this skill directory, inspect the plan:

   ```bash
   sudo scripts/provision-ubuntu-dev-tools.sh --dry-run
   ```

3. After the creator authorizes installation, run:

   ```bash
   sudo scripts/provision-ubuntu-dev-tools.sh
   ```

The helper verifies every installed command and exits on failure. It does not
configure user accounts, authentication, repositories, cloud projects, or SSH
access.

## Enable public prototype previews

When the infrastructure creator authorizes public workshop previews, run the
firewall helper from a machine where the creator is already authenticated to
Google Cloud. Inspect its plan first:

```bash
scripts/ensure-gcp-preview-firewall.sh \
  --project PROJECT_ID --zone ZONE --instance VM_NAME
```

Then apply the reviewed plan:

```bash
scripts/ensure-gcp-preview-firewall.sh \
  --project PROJECT_ID --zone ZONE --instance VM_NAME --apply
```

The helper adds a dedicated network tag to the chosen existing VM and creates
or updates only the dedicated ingress firewall rule. It permits public TCP
ports 3000-3999 for tagged instances. It does not create a VM, authenticate a
user, change unrelated firewall rules, or open other ports.

This is an infrastructure-creator operation. It uses the creator's existing
`gcloud` authentication and never handles workshop-user credentials.

## Do not use this skill for

- macOS, Windows, non-Ubuntu, or non-LTS hosts.
- Developer self-service setup or any task requiring sign-in.
- Credential migration, secret storage, browser-profile copying, or device
  authorization.
