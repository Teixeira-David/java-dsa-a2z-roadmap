#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
export XDG_CONFIG_HOME="$REPO_ROOT/automation"

TARGET_ID="${1:-1}"
TARGET_TITLE="${2:-Two Sum}"
COUNT="${3:-5}"
SOLVED_IDS="${4:-}"
OPTIONAL_CONSTRAINTS="${5:-Prefer HashMap-based; max 1 two-pointer variant.}"

{
    echo "METADATA"
    echo "TARGET_PROBLEM_ID: $TARGET_ID"
    echo "TARGET_PROBLEM_TITLE: $TARGET_TITLE"
    echo "COUNT: $COUNT"
    echo "SOLVED_IDS: $SOLVED_IDS"
    echo "OPTIONAL_CONSTRAINTS: $OPTIONAL_CONSTRAINTS"
    echo ""
    curl -s "https://leetcode.ca/all/problems.html"
} | fabric -p similar_problems_from_index
