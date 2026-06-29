# NotX Installer (NX)

A modular Linux Bash multitool installer for managing PteroPanel, AirLink Panel, Node, and Daemon installations.

## One-Line Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/shyamplay244-max/notx-installer/main/install.sh)
```

## Repository Structure

- install.sh - main entry point
- scripts/common.sh - shared UI and validation helpers
- scripts/utils.sh - progress and status helpers
- scripts/dependencies.sh - dependency installation helper
- scripts/ptero.sh - PteroPanel workflow
- scripts/airlink.sh - AirLink workflow
- scripts/node.sh - node workflow
- scripts/daemon.sh - daemon workflow
- scripts/full.sh - full automation workflow
- scripts/update.sh - update workflow
- scripts/repair.sh - repair workflow
- scripts/backup.sh - backup workflow
- scripts/restore.sh - restore workflow
- scripts/uninstall.sh - uninstall workflow
