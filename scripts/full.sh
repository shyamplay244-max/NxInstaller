#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
REPO_BASE="${REPO_BASE:-https://raw.githubusercontent.com/shyamplay244-max/NxInstaller/main}"
source <(curl -fsSL "${REPO_BASE}/scripts/common.sh")
source <(curl -fsSL "${REPO_BASE}/scripts/utils.sh")

show_banner
show_progress "Preparing full automatic setup..."
echo
read -rp "Choose Panel [1=PteroPanel, 2=AirLink]: " panel_choice
case "$panel_choice" in
  1) show_progress "Installing PteroPanel stack..." ;;
  2) show_progress "Installing AirLink stack..." ;;
  *) show_warning "Invalid panel selection"; exit 1 ;;
esac
check_os
require_root
check_dependencies
check_internet
show_success "Full automatic setup workflow started"
wait_for_enter
