#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/lib/fabric-common.sh"
resolve_repo_root
pattern="code_review"
ensure_pattern "$pattern"
sync_pattern "$pattern"
prepare_env

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <path-to-file>" >&2
  exit 1
fi
INPUT_FILE="$1"
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "File not found: $INPUT_FILE" >&2
  exit 1
fi

{
  echo "METADATA"
  echo "FILE: $INPUT_FILE"
  echo "END"
  cat "$INPUT_FILE"
} | run_fabric "$pattern"
