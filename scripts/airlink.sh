#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source <(curl -fsSL https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main/scripts/common.sh)
source <(curl -fsSL https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main/scripts/utils.sh)

show_banner
show_progress "Preparing AirLink Panel installation..."
check_os
require_root
check_dependencies
check_internet
show_success "AirLink Panel installation workflow started"
wait_for_enter
