#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
REPO_FABRIC_HOME="$REPO_ROOT/automation"
export XDG_CONFIG_HOME="$REPO_FABRIC_HOME"
FABRIC_CONFIG_DIR="$REPO_FABRIC_HOME/.config/fabric"
mkdir -p "$FABRIC_CONFIG_DIR/patterns"
cp -R "$REPO_FABRIC_HOME/fabric/patterns/." "$FABRIC_CONFIG_DIR/patterns/"
touch "$FABRIC_CONFIG_DIR/.env"

TARGET_FOLDER="${1:-hashing}"        # e.g. hashing, arrays, dp
TARGET_TIER="${2:-easy}"             # easy|medium|hard|expert
SOLVED_IDS="${3:-}"                  # e.g. "1,20,53"
OPTIONAL_CONSTRAINTS="${4:-}"        # free text

INDEX_URL="https://leetcode.ca/all/problems.html"

{
  echo "METADATA"
  echo "TARGET_FOLDER: $TARGET_FOLDER"
  echo "TARGET_TIER: $TARGET_TIER"
  echo "SOLVED_IDS: $SOLVED_IDS"
  echo "OPTIONAL_CONSTRAINTS: $OPTIONAL_CONSTRAINTS"
  echo ""
  curl -s "$INDEX_URL"
} | HOME="$REPO_FABRIC_HOME" fabric -p pick_next_leetcode_problem
