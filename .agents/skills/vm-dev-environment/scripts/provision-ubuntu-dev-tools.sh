#!/usr/bin/env bash
# Provision shared development tools on an Ubuntu LTS VM. This script never authenticates users.
set -euo pipefail

dry_run=false

usage() {
  printf '%s\n' "Usage: $(basename "$0") [--dry-run]"
}

run() {
  printf '+ '
  printf '%q ' "$@"
  printf '\n'
  if ! "$dry_run"; then
    "$@"
  fi
}

cleanup_temp_files() {
  [[ -z "${nodesource_key_file:-}" ]] || rm -f -- "$nodesource_key_file"
  [[ -z "${github_key_file:-}" ]] || rm -f -- "$github_key_file"
  [[ -z "${gcloud_key_file:-}" ]] || rm -f -- "$gcloud_key_file"
}

case "${1:-}" in
  "") ;;
  --dry-run) dry_run=true ;;
  --help|-h) usage; exit 0 ;;
  *) usage >&2; exit 2 ;;
esac

if [[ ! -r /etc/os-release ]]; then
  printf '%s\n' "Unsupported host: /etc/os-release is unavailable." >&2
  exit 1
fi

# shellcheck disable=SC1091
source /etc/os-release
if [[ "${ID:-}" != "ubuntu" || "${VERSION:-}" != *"LTS"* ]]; then
  printf '%s\n' "Unsupported host: this helper requires Ubuntu LTS." >&2
  exit 1
fi

if [[ "$EUID" -ne 0 ]]; then
  printf '%s\n' "Administrator privileges are required; re-run with sudo." >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive
github_arch="$(dpkg --print-architecture)"
nodesource_source="deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main"
github_source="deb [arch=${github_arch} signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main"
gcloud_source="deb [signed-by=/etc/apt/keyrings/google-cloud.gpg] https://packages.cloud.google.com/apt cloud-sdk main"

if "$dry_run"; then
  nodesource_key_file="<mktemp NodeSource key file>"
  github_key_file="<mktemp GitHub key file>"
  gcloud_key_file="<mktemp Google Cloud key file>"
else
  nodesource_key_file=""
  github_key_file=""
  gcloud_key_file=""
  trap cleanup_temp_files EXIT
  nodesource_key_file="$(mktemp /tmp/codex-vm-nodesource-key.XXXXXX)"
  github_key_file="$(mktemp /tmp/codex-vm-gh-key.XXXXXX)"
  gcloud_key_file="$(mktemp /tmp/codex-vm-gcloud-key.XXXXXX)"
  chmod 600 -- "$nodesource_key_file" "$github_key_file" "$gcloud_key_file"
fi

run apt-get update
run apt-get install -y ca-certificates curl gnupg git python3 python3-venv python3-pip

run install -d -m 0755 /etc/apt/keyrings
run curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key -o "$nodesource_key_file"
run gpg --dearmor --yes --output /etc/apt/keyrings/nodesource.gpg "$nodesource_key_file"
run sh -c "printf '%s\\n' '${nodesource_source}' > /etc/apt/sources.list.d/nodesource.list"

run curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg -o "$github_key_file"
run install -m 0644 "$github_key_file" /etc/apt/keyrings/githubcli-archive-keyring.gpg
run sh -c "printf '%s\\n' '${github_source}' > /etc/apt/sources.list.d/github-cli.list"

run curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg -o "$gcloud_key_file"
run gpg --dearmor --yes --output /etc/apt/keyrings/google-cloud.gpg "$gcloud_key_file"
run sh -c "printf '%s\\n' '${gcloud_source}' > /etc/apt/sources.list.d/google-cloud-sdk.list"

run apt-get update
run apt-get install -y nodejs gh google-cloud-cli
run sh -c "curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR=/usr/local/bin UV_NO_MODIFY_PATH=1 sh"
run npm install -g @openai/codex

if "$dry_run"; then
  printf '%s\n' "Dry run complete. No packages were installed and no credentials were accessed."
  exit 0
fi

git --version
python3 --version
python3 -m venv --help >/dev/null
pip3 --version
node --version
npm --version
uv --version
gh --version
gcloud --version
codex --version

printf '%s\n' "Shared development tools installed and verified. No authentication was performed."
