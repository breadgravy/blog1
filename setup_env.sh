#!/usr/bin/env bash
set -euo pipefail

DRY_RUN="${DRY_RUN:-0}"

log() {
  printf '\n[%s] %s\n' "$(date '+%H:%M:%S')" "$*"
}

run_cmd() {
  if [[ "$DRY_RUN" == "1" ]]; then
    echo "[dry-run] $*"
  else
    eval "$*"
  fi
}

need_cmd() {
  ! command -v "$1" >/dev/null 2>&1
}

install_with_apt() {
  local pkgs=(hugo nodejs npm)
  run_cmd "sudo apt-get update"
  run_cmd "sudo apt-get install -y ${pkgs[*]}"
}

install_with_dnf() {
  local pkgs=(hugo nodejs npm)
  run_cmd "sudo dnf install -y ${pkgs[*]}"
}

install_with_yum() {
  local pkgs=(hugo nodejs npm)
  run_cmd "sudo yum install -y ${pkgs[*]}"
}

install_with_pacman() {
  local pkgs=(hugo nodejs npm)
  run_cmd "sudo pacman -Sy --noconfirm ${pkgs[*]}"
}

install_with_brew() {
  local pkgs=(hugo node)
  run_cmd "brew install ${pkgs[*]}"
}

main() {
  if ! need_cmd hugo && ! need_cmd npm; then
    log "hugo and npm already installed; nothing to do"
    return 0
  fi

  log "Installing required dependencies for local blog setup (hugo, nodejs/npm)"

  if command -v apt-get >/dev/null 2>&1; then
    install_with_apt
  elif command -v dnf >/dev/null 2>&1; then
    install_with_dnf
  elif command -v yum >/dev/null 2>&1; then
    install_with_yum
  elif command -v pacman >/dev/null 2>&1; then
    install_with_pacman
  elif command -v brew >/dev/null 2>&1; then
    install_with_brew
  else
    echo "Error: unsupported package manager. Install hugo and npm manually."
    return 1
  fi

  log "Dependency installation complete"
  run_cmd "hugo version"
  run_cmd "npm --version"
}

main "$@"
