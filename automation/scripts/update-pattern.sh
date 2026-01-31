#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
PATTERN_SRC="${REPO_ROOT}/automation/fabric/patterns"
MODE="${1:-where}"

if [[ ! -d "$PATTERN_SRC" ]]; then
  echo "Pattern source directory not found: $PATTERN_SRC"
  exit 1
fi

case "$MODE" in
  where)
    echo "Repo-local Fabric config:"
    echo "  XDG_CONFIG_HOME=${REPO_ROOT}/automation"
    echo "  Patterns dir=${REPO_ROOT}/automation/fabric/patterns"
    echo ""
    echo "Patterns visible to Fabric (repo-local):"
    XDG_CONFIG_HOME="${REPO_ROOT}/automation" fabric -l | sed -n '1,120p'
    ;;
  install)
    DEST="${HOME}/.config/fabric/patterns"
    mkdir -p "$DEST"
    cp -f "${PATTERN_SRC}/"*.txt "$DEST/"
    echo "Copied patterns to: $DEST"
    echo "Note: your repo scripts still use repo-local patterns via XDG_CONFIG_HOME."
    ;;
  *)
    echo "Usage: $0 [where|install]"
    exit 1
    ;;
esac

