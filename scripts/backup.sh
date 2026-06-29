#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
REPO_BASE="${REPO_BASE:-https://raw.githubusercontent.com/shyamplay244-max/NxInstaller/main}"
source <(curl -fsSL "${REPO_BASE}/scripts/common.sh")
source <(curl -fsSL "${REPO_BASE}/scripts/utils.sh")

show_banner
show_progress "Preparing backup..."
show_success "Backup workflow started"
wait_for_enter
