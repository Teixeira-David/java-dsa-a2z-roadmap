#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
export XDG_CONFIG_HOME="$REPO_ROOT/automation"

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
} | fabric -p pick_next_leetcode_problem

