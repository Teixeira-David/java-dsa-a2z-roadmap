#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"

MAIN_BASE="${REPO_ROOT}/src/main/java/a2z/dsa"
TEST_BASE="${REPO_ROOT}/src/test/java/a2z/dsa"

DOC_TEMPLATES="${REPO_ROOT}/docs/templates"
README_TEMPLATE="${DOC_TEMPLATES}/topic-readme.md"
PROBLEMS_TEMPLATE="${DOC_TEMPLATES}/problem-entry.md"

TOPIC="${1:-}"
SUBTOPIC="${2:-}"
CLASS_NAME="${3:-}" # optional, e.g., TwoSum

if [[ -z "${TOPIC}" || -z "${SUBTOPIC}" ]]; then
  echo "Usage: $0 <topic> <subtopic> [ClassName]"
  echo "Example: $0 hashing basics TwoSum"
  exit 1
fi

MAIN_DIR="${MAIN_BASE}/${TOPIC}/${SUBTOPIC}"
TEST_DIR="${TEST_BASE}/${TOPIC}/${SUBTOPIC}"

# --- main: README.md, problems.md, solutions/ ---
mkdir -p "${MAIN_DIR}/solutions"

if [[ ! -f "${MAIN_DIR}/README.md" ]]; then
  if [[ -f "${README_TEMPLATE}" ]]; then
    cp "${README_TEMPLATE}" "${MAIN_DIR}/README.md"
  else
    cat > "${MAIN_DIR}/README.md" <<'MD'
# Subtopic

## ✅ Done means...
- [ ] I can explain the core patterns
- [ ] I can implement from scratch in Java
- [ ] I can list edge cases
- [ ] I can derive time/space complexity
- [ ] I have tests for tricky cases

## Notes
- ...
MD
  fi
fi

if [[ ! -f "${MAIN_DIR}/problems.md" ]]; then
  if [[ -f "${PROBLEMS_TEMPLATE}" ]]; then
    cp "${PROBLEMS_TEMPLATE}" "${MAIN_DIR}/problems.md"
  else
    cat > "${MAIN_DIR}/problems.md" <<'MD'
# Problems

## Easy
- [ ] LC # — Title — Tags: — Why:

## Medium
- [ ] LC # — Title — Tags: — Why:

## Hard
- [ ] LC # — Title — Tags: — Why:

## Expert
- [ ] LC # — Title — Tags: — Why:
MD
  fi
fi

# --- test: directory + (optional) empty test file ---
mkdir -p "${TEST_DIR}"

if [[ -n "${CLASS_NAME}" ]]; then
  TEST_FILE="${TEST_DIR}/${CLASS_NAME}Test.java"
  if [[ ! -f "${TEST_FILE}" ]]; then
    touch "${TEST_FILE}"
  fi

  SOLN_FILE="${MAIN_DIR}/solutions/${CLASS_NAME}.java"
  if [[ ! -f "${SOLN_FILE}" ]]; then
    touch "${SOLN_FILE}"
  fi
fi

echo "Initialized:"
echo "  main: ${MAIN_DIR}"
echo "  test: ${TEST_DIR}"
EOF

chmod +x automation/scripts/init-bucket.sh
