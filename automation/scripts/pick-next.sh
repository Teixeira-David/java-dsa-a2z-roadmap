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
  echo "TARGET_FOLDER: $TARGET_FOLDER"
  echo "TARGET_TIER: $TARGET_TIER"
  echo "SOLVED_IDS: $SOLVED_IDS"
  echo "OPTIONAL_CONSTRAINTS: $OPTIONAL_CONSTRAINTS"
  echo ""
  echo "INDEX_TSV"
  curl -s "$INDEX_URL" | extract_index_tsv
} | HOME="$REPO_FABRIC_HOME" fabric -p pick_next_leetcode_problem
