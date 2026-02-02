#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/lib/fabric-common.sh"
resolve_repo_root
pattern="plan_intake"
ensure_pattern "$pattern"
sync_pattern "$pattern"
prepare_env

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <short-task-description>" >&2
  exit 1
fi
DESCRIPTION="$*"

{
  echo "METADATA"
  echo "DESCRIPTION: $DESCRIPTION"
  echo "END"
  echo "$DESCRIPTION"
} | run_fabric "$pattern"
