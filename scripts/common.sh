#!/usr/bin/env bash
set -euo pipefail

# Common functions for the NotX Installer

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m'
REPO_BASE="${REPO_BASE:-https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main}"

log_info() {
  echo -e "${CYAN}[•]${RESET} $*"
}

log_success() {
  echo -e "${GREEN}[✓]${RESET} $*"
}

log_warn() {
  echo -e "${YELLOW}[!]${RESET} $*"
}

log_error() {
  echo -e "${RED}[✗]${RESET} $*"
}

show_banner() {
  clear
  echo
  cat <<'EOF'
         ███╗   ██╗██╗  ██╗
         ████╗  ██║╚██╗██╔╝
         ██╔██╗ ██║ ╚███╔╝
         ██║╚██╗██║ ██╔██╗
         ██║ ╚████║██╔╝ ██╗
         ╚═╝  ╚═══╝╚═╝  ╚═╝

             N O T X   I N S T A L L E R
EOF
  echo
  echo "============================================================"
  echo
}

show_main_menu() {
  show_banner
  echo -e "${CYAN}[1]${RESET} Install PteroPanel"
  echo
  echo -e "${CYAN}[2]${RESET} Install AirLink Panel"
  echo
  echo -e "${CYAN}[3]${RESET} Configure Node"
  echo
  echo -e "${CYAN}[4]${RESET} Install Daemon"
  echo
  echo -e "${CYAN}[5]${RESET} Full Automatic Setup"
  echo
  echo "--------------------------------"
  echo
  echo -e "${CYAN}[6]${RESET} Update Existing Installation"
  echo
  echo -e "${CYAN}[7]${RESET} Repair Installation"
  echo
  echo -e "${CYAN}[8]${RESET} Backup Panel"
  echo
  echo -e "${CYAN}[9]${RESET} Restore Backup"
  echo
  echo -e "${CYAN}[10]${RESET} Uninstall"
  echo
  echo "--------------------------------"
  echo
  echo -e "${CYAN}[0]${RESET} Exit"
  echo
  echo "============================================================"
  echo
  read -rp "Select Option: " choice
  case "$choice" in
    1) run_script "ptero" ;;
    2) run_script "airlink" ;;
    3) run_script "node" ;;
    4) run_script "daemon" ;;
    5) run_script "full" ;;
    6) run_script "update" ;;
    7) run_script "repair" ;;
    8) run_script "backup" ;;
    9) run_script "restore" ;;
    10) run_script "uninstall" ;;
    0) exit 0 ;;
    *) log_warn "Invalid selection"; sleep 1; show_main_menu ;;
  esac
}

run_script() {
  local name="$1"
  local script_url="${REPO_BASE}/scripts/${name}.sh"
  log_info "Downloading ${name} module..."
  curl -fsSL "$script_url" | bash
}

require_root() {
  if [[ $EUID -ne 0 ]]; then
    log_error "Root privileges are required. Please run this installer as root."
    exit 1
  fi
}

check_dependencies() {
  local missing=()
  for cmd in curl wget sudo; do
    command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
  done
  if (( ${#missing[@]} )); then
    log_error "Missing required dependencies: ${missing[*]}"
    exit 1
  fi
}

check_os() {
  if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    if [[ "$ID" != "ubuntu" ]]; then
      log_error "Unsupported OS detected: $PRETTY_NAME"
      exit 1
    fi
  else
    log_error "Unable to detect operating system."
    exit 1
  fi
}

check_internet() {
  if ! curl -IsS https://github.com >/dev/null 2>&1; then
    log_error "No internet connection detected."
    exit 1
  fi
}
