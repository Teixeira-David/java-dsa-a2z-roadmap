#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/lib/fabric-common.sh"
resolve_repo_root
pattern="portfolio_writeup"
ensure_pattern "$pattern"
sync_pattern "$pattern"
prepare_env

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <path-to-solution-java-file> [path-to-problems-md]" >&2
  exit 1
fi
SOLUTION_FILE="$1"
if [[ ! -f "$SOLUTION_FILE" ]]; then
  echo "Solution file not found: $SOLUTION_FILE" >&2
  exit 1
fi
PROBLEMS_FILE="${2:-}"
if [[ -n "$PROBLEMS_FILE" && ! -f "$PROBLEMS_FILE" ]]; then
  echo "Problems file not found: $PROBLEMS_FILE" >&2
  exit 1
fi

{
  echo "METADATA"
  echo "SOLUTION: $SOLUTION_FILE"
  [[ -n "$PROBLEMS_FILE" ]] && echo "PROBLEMS: $PROBLEMS_FILE"
  echo "END"
  cat "$SOLUTION_FILE"
  if [[ -n "$PROBLEMS_FILE" ]]; then
    echo "\n---"
    cat "$PROBLEMS_FILE"
  fi
} | run_fabric "$pattern"
