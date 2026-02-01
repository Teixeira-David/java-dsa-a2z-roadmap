#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
REPO_FABRIC_HOME="$REPO_ROOT/automation"
export XDG_CONFIG_HOME="$REPO_FABRIC_HOME"
FABRIC_CONFIG_DIR="$REPO_FABRIC_HOME/.config/fabric"
mkdir -p "$FABRIC_CONFIG_DIR/patterns"
cp -R "$REPO_FABRIC_HOME/fabric/patterns/." "$FABRIC_CONFIG_DIR/patterns/"
touch "$FABRIC_CONFIG_DIR/.env"

TARGET_ID="${1:-1}"
TARGET_TITLE="${2:-Two Sum}"
COUNT="${3:-5}"
SOLVED_IDS="${4:-}"
OPTIONAL_CONSTRAINTS="${5:-Prefer HashMap-based; max 1 two-pointer variant.}"
INDEX_URL="https://leetcode.ca/all/problems.html"

extract_index_tsv() {
  perl -0777 -ne '
    while (/<tr[^>]*>\s*<td[^>]*>\s*(\d+)\s*<\/td>\s*<td[^>]*>\s*<a[^>]*>([^<]+)<\/a>\s*<\/td>\s*<td[^>]*>\s*(Easy|Medium|Hard)\s*<\/td>/sg) {
      my ($id, $title, $diff) = ($1, $2, $3);
      $title =~ s/\s+/ /g;
      print "$id\t$title\t$diff\n";
    }
  '
}

{
    echo "METADATA"
    echo "TARGET_PROBLEM_ID: $TARGET_ID"
    echo "TARGET_PROBLEM_TITLE: $TARGET_TITLE"
    echo "COUNT: $COUNT"
    echo "SOLVED_IDS: $SOLVED_IDS"
    echo "OPTIONAL_CONSTRAINTS: $OPTIONAL_CONSTRAINTS"
    echo ""
    echo "INDEX_TSV"
    curl -s "$INDEX_URL" | extract_index_tsv
} | HOME="$REPO_FABRIC_HOME" fabric -p similar_problems_from_index
