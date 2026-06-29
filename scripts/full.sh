#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source <(curl -fsSL https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main/scripts/common.sh)
source <(curl -fsSL https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main/scripts/utils.sh)

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
