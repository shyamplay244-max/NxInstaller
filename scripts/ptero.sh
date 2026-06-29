#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
REPO_BASE="${REPO_BASE:-https://raw.githubusercontent.com/shyamplay244-max/NxInstaller/main}"
source <(curl -fsSL "${REPO_BASE}/scripts/common.sh")
source <(curl -fsSL "${REPO_BASE}/scripts/utils.sh")
source <(curl -fsSL "${REPO_BASE}/scripts/dependencies.sh")

show_banner
show_progress "Preparing PteroPanel installation..."
check_os
require_root
check_dependencies
check_internet
install_core_dependencies
show_success "PteroPanel installation workflow started"
wait_for_enter
