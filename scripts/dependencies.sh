#!/usr/bin/env bash
set -euo pipefail

install_core_dependencies() {
  show_progress "Checking Ubuntu Version..."
  apt-get update
  apt-get install -y software-properties-common apt-transport-https ca-certificates gnupg lsb-release curl wget unzip sudo
  show_success "Core dependencies installed"
}
