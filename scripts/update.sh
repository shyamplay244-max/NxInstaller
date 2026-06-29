#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC1091
source <(curl -fsSL https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main/scripts/common.sh)
source <(curl -fsSL https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main/scripts/utils.sh)

show_banner
show_progress "Checking existing installation..."
show_success "Update workflow started"
wait_for_enter
