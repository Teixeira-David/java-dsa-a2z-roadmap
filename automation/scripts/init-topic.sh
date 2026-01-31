#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"

# Where your topics live (adjust if you use a different base package path)
BASE_DIR="${REPO_ROOT}/src/main/java/a2z/dsa"
DOC_TEMPLATES="${REPO_ROOT}/docs/templates"

TOPIC="${1:-}"
if [[ -z "$TOPIC" ]]; then
  echo "Usage: $0 <topic>"
  echo "Example: $0 binarysearch"
  exit 1
fi

TOPIC_DIR="${BASE_DIR}/${TOPIC}"

# Create base topic directory
mkdir -p "$TOPIC_DIR"

# Create README.md + problems.md from templates if available, otherwise stub them
if [[ -f "${DOC_TEMPLATES}/topic-readme.md" ]]; then
  cp "${DOC_TEMPLATES}/topic-readme.md" "${TOPIC_DIR}/README.md"
else
  cat > "${TOPIC_DIR}/README.md" <<'EOF'
# Topic

## ✅ Done means...
- [ ] I can explain the core patterns
- [ ] I can implement from scratch in Java
- [ ] I can list edge cases
- [ ] I can derive time/space complexity
- [ ] I have tests for tricky cases

## Patterns checklist
- [ ] ...

## Minimum canonical problems
See `problems.md`.
EOF
fi

if [[ -f "${DOC_TEMPLATES}/problem-entry.md" ]]; then
  cp "${DOC_TEMPLATES}/problem-entry.md" "${TOPIC_DIR}/problems.md"
else
  cat > "${TOPIC_DIR}/problems.md" <<'EOF'
# Problems

## Easy
- [ ] LC # — Title — Tags: — Why:

## Medium
- [ ] LC # — Title — Tags: — Why:

## Hard
- [ ] LC # — Title — Tags: — Why:

## Expert
- [ ] LC # — Title — Tags: — Why:
EOF
fi

# Always create a solutions folder
mkdir -p "${TOPIC_DIR}/solutions"

# Create recommended subdirectories for heavy topics
case "$TOPIC" in
  arrays)
    mkdir -p "${TOPIC_DIR}/prefixsum" "${TOPIC_DIR}/kadane" "${TOPIC_DIR}/two_pointers" \
             "${TOPIC_DIR}/cyclic_sort" "${TOPIC_DIR}/subarray_counting"
    ;;
  binarysearch)
    mkdir -p "${TOPIC_DIR}/bounds" "${TOPIC_DIR}/rotated" "${TOPIC_DIR}/answer_space" "${TOPIC_DIR}/matrix"
    ;;
  strings)
    mkdir -p "${TOPIC_DIR}/two_pointers" "${TOPIC_DIR}/frequency" "${TOPIC_DIR}/parsing" "${TOPIC_DIR}/string_algorithms"
    ;;
  recursion)
    mkdir -p "${TOPIC_DIR}/basics" "${TOPIC_DIR}/backtracking" "${TOPIC_DIR}/divide_conquer"
    ;;
  stackqueue)
    mkdir -p "${TOPIC_DIR}/basics" "${TOPIC_DIR}/monotonic_stack" "${TOPIC_DIR}/monotonic_queue" "${TOPIC_DIR}/expression_eval"
    ;;
  slidingwindow)
    mkdir -p "${TOPIC_DIR}/fixed" "${TOPIC_DIR}/variable" "${TOPIC_DIR}/at_most_k" "${TOPIC_DIR}/deque_max_min"
    ;;
  heaps)
    mkdir -p "${TOPIC_DIR}/top_k" "${TOPIC_DIR}/two_heaps" "${TOPIC_DIR}/scheduling"
    ;;
  trees)
    mkdir -p "${TOPIC_DIR}/traversals" "${TOPIC_DIR}/properties" "${TOPIC_DIR}/paths" "${TOPIC_DIR}/lca" "${TOPIC_DIR}/bfs"
    ;;
  graphs)
    mkdir -p "${TOPIC_DIR}/traversal" "${TOPIC_DIR}/bipartite" "${TOPIC_DIR}/topo" \
             "${TOPIC_DIR}/shortest_path" "${TOPIC_DIR}/mst_dsu" "${TOPIC_DIR}/grid_graphs"
    ;;
  dp)
    mkdir -p "${TOPIC_DIR}/intro" "${TOPIC_DIR}/one_d" "${TOPIC_DIR}/grid" "${TOPIC_DIR}/subsequence" \
             "${TOPIC_DIR}/lis" "${TOPIC_DIR}/knapsack" "${TOPIC_DIR}/partition_mcm" "${TOPIC_DIR}/dp_on_trees"
    ;;
  trie)
    mkdir -p "${TOPIC_DIR}/prefix" "${TOPIC_DIR}/word_search" "${TOPIC_DIR}/xor_trie"
    ;;
  *)
    # light topics: no subdirs by default
    ;;
esac

echo "Initialized topic structure at: ${TOPIC_DIR}"

