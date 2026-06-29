#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_BASE="https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main"

# shellcheck disable=SC1091
source <(curl -fsSL "${REPO_BASE}/scripts/common.sh")

show_banner
show_main_menu
