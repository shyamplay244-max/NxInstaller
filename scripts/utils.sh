#!/usr/bin/env bash
set -euo pipefail

show_progress() {
  local message="$1"
  echo -e "\033[0;36m[•]\033[0m $message"
}

show_success() {
  local message="$1"
  echo -e "\033[0;32m[✓]\033[0m $message"
}

show_warning() {
  local message="$1"
  echo -e "\033[1;33m[!]\033[0m $message"
}

show_failure() {
  local message="$1"
  echo -e "\033[0;31m[✗]\033[0m $message"
}

wait_for_enter() {
  read -rp "Press Enter to continue..." _
}
