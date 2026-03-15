#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${PORT:-8080}"
HOST="${HOST:-0.0.0.0}"
BASE_URL="${BASE_URL:-http://localhost:${PORT}}"
INSTALL_THEME_DEPS="${INSTALL_THEME_DEPS:-1}"
RUN_SERVER="${RUN_SERVER:-1}"

log() {
  printf '\n[%s] %s\n' "$(date '+%H:%M:%S')" "$*"
}

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: '$1' is required but not installed."
    return 1
  fi
}

main() {
  log "Preparing local blog deployment from ${ROOT_DIR}"
  require_cmd hugo

  cd "$ROOT_DIR"

  if [[ "$INSTALL_THEME_DEPS" == "1" ]] && [[ -f "themes/archie/package.json" ]]; then
    if ! command -v npm >/dev/null 2>&1; then
      log "npm not found; skipping optional theme dependency install"
    else
      log "Installing theme dependencies with npm ci"
      npm --prefix themes/archie ci
    fi
  fi

  log "Building static site into ./public"
  hugo --minify --cleanDestinationDir

  if [[ "$RUN_SERVER" == "1" ]]; then
    log "Starting Hugo server at ${BASE_URL} (bind: ${HOST}, port: ${PORT})"
    hugo server \
      --bind "$HOST" \
      --port "$PORT" \
      --baseURL "$BASE_URL" \
      --disableFastRender \
      --cleanDestinationDir
  else
    log "RUN_SERVER=0, skipping server start after successful build"
  fi
}

main "$@"
