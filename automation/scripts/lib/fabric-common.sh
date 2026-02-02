#!/usr/bin/env bash
set -euo pipefail

resolve_repo_root() {
  REPO_ROOT=$(git rev-parse --show-toplevel)
  REPO_FABRIC_HOME="$REPO_ROOT/automation"
  FABRIC_HOME="$REPO_FABRIC_HOME"
  REPO_PATTERNS_DIR="$REPO_FABRIC_HOME/fabric/patterns"
  FABRIC_CONFIG_DIR="$FABRIC_HOME/.config/fabric"
  FABRIC_PATTERNS_DIR="$FABRIC_CONFIG_DIR/patterns"
}

ensure_pattern() {
  local pattern_name="$1"
  local source_dir="$REPO_PATTERNS_DIR/$pattern_name"
  if [[ ! -f "$source_dir/system.md" ]]; then
    echo "Pattern '$pattern_name' missing from $source_dir" >&2
    return 2
  fi
}

sync_pattern() {
  local pattern_name="$1"
  mkdir -p "$FABRIC_PATTERNS_DIR"
  rm -rf "$FABRIC_PATTERNS_DIR/$pattern_name"
  cp -R "$REPO_PATTERNS_DIR/$pattern_name" "$FABRIC_PATTERNS_DIR/$pattern_name"
}

prepare_env() {
  mkdir -p "$FABRIC_CONFIG_DIR"
  touch "$FABRIC_CONFIG_DIR/.env"
}

run_fabric() {
  local pattern_name="$1"
  shift
  HOME="$FABRIC_HOME" fabric -p "$pattern_name" "$@"
}
