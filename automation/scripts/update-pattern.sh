#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
REPO_FABRIC_HOME="$REPO_ROOT/automation"
PATTERN_SRC="${REPO_FABRIC_HOME}/fabric/patterns"
MODE="${1:-where}"

if [[ ! -d "$PATTERN_SRC" ]]; then
  echo "Pattern source directory not found: $PATTERN_SRC"
  exit 1
fi

prepare_repo_fabric_config() {
  local config_dir="$REPO_FABRIC_HOME/.config/fabric"
  mkdir -p "$config_dir/patterns"
  cp -R "${PATTERN_SRC}/." "$config_dir/patterns/"
  touch "$config_dir/.env"
}

case "$MODE" in
  where)
    echo "Repo-local Fabric config:"
    echo "  XDG_CONFIG_HOME=${REPO_ROOT}/automation"
    echo "  Patterns dir=${REPO_ROOT}/automation/fabric/patterns"
    echo ""
    echo "Patterns visible to Fabric (repo-local):"
    prepare_repo_fabric_config
    HOME="$REPO_ROOT/automation" XDG_CONFIG_HOME="${REPO_ROOT}/automation" fabric -l | sed -n '1,120p'
    ;;
  install)
    DEST="${HOME}/.config/fabric/patterns"
    rm -rf "$DEST"
    mkdir -p "$DEST"
    cp -R "${PATTERN_SRC}/"* "$DEST/"
    echo "Copied pattern directories to: $DEST"
    echo "Note: your repo scripts still use repo-local patterns via XDG_CONFIG_HOME."
    ;;
  *)
    echo "Usage: $0 [where|install]"
    exit 1
    ;;
esac
