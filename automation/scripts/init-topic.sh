#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"

# Where your topics live (adjust if you use a different base package path)
BASE_DIR="${REPO_ROOT}/src/main/java/a2z/dsa"
DOC_TEMPLATES="${REPO_ROOT}/docs/templates"

declare -A RECOMMENDED_SUBTOPICS=(
  [arrays]="prefixsum kadane two_pointers cyclic_sort subarray_counting"
  [binarysearch]="bounds rotated answer_space matrix"
  [bit]="basics subsets xor bitmask_dp"
  [bst]="traversals properties construction lca validation"
  [greedy]="interval_scheduling activity_selection task_scheduling coin_change"
  [hashing]="basics collision_resolution lc_design"
  [linkedlist]="basics two_pointer cycle_detection merge_sort"
  [math]="number_theory combinatorics geometry probability"
  [sorting]="comparison_based non_comparison_based specialized"
  [stackqueue]="basics monotonic_stack monotonic_queue expression_eval"
  [strings]="two_pointers frequency parsing string_algorithms"
  [recursion]="basics backtracking divide_conquer"
  [slidingwindow]="fixed variable at_most_k deque_max_min"
  [heaps]="top_k two_heaps scheduling"
  [trees]="traversals properties paths lca bfs"
  [graphs]="traversal bipartite topo shortest_path mst_dsu grid_graphs"
  [dp]="intro one_d grid subsequence lis knapsack partition_mcm dp_on_trees"
  [trie]="prefix word_search xor_trie"
)

usage() {
  cat <<EOF >&2
Usage: $0 <topic> <subtopic>
Example: $0 arrays kadane
       $0 dp subsequence
Common subtopics:
  arrays: ${RECOMMENDED_SUBTOPICS[arrays]}
  binarysearch: ${RECOMMENDED_SUBTOPICS[binarysearch]}
  trees: ${RECOMMENDED_SUBTOPICS[trees]}
Use the list above (or your own subtopic) to keep README/problems/solutions grouped under src/main/java/a2z/dsa/<topic>/<subtopic>.
EOF
  exit 1
}

TOPIC="${1:-}"
SUBTOPIC="${2:-}"

if [[ -z "$TOPIC" ]]; then
  usage
elif [[ -z "$SUBTOPIC" ]]; then
  echo "Subtopics for $TOPIC: ${RECOMMENDED_SUBTOPICS[$TOPIC]:-basics}"
  echo "Run '$0 $TOPIC <subtopic>' to scaffold that submodule."
  usage
fi

TARGET_DIR="${BASE_DIR}/${TOPIC}/${SUBTOPIC}"
mkdir -p "${TARGET_DIR}/solutions"

# Create README.md + problems.md from templates if available, otherwise stub them
README_TEMPLATE="${DOC_TEMPLATES}/topic-readme.md"
PROBLEMS_TEMPLATE="${DOC_TEMPLATES}/problem-entry.md"
README_TARGET="${TARGET_DIR}/README.md"
PROBLEMS_TARGET="${TARGET_DIR}/problems.md"

copy_if_missing() {
  local template="$1" target="$2" stub="$3"
  if [[ -f "$target" ]]; then
    echo "$(basename "$target") exists; skipping"
    return
  fi
  if [[ -f "$template" ]]; then
    cp "$template" "$target"
  else
    cat > "$target" <<EOF
$stub
EOF
  fi
}

README_STUB=$'# Subtopic\n\n## ✅ Done means...\n- [ ] I can explain the core patterns\n- [ ] I can implement from scratch in Java\n- [ ] I can list edge cases\n- [ ] I can derive time/space complexity\n- [ ] I have tests for tricky cases\n\n## Patterns checklist\n- [ ] ...\n\n## Minimum canonical problems\nSee `problems.md`.'
PROBLEMS_STUB=$'# Problems\n\n## Easy\n- [ ] LC # — Title — Tags: — Why:\n\n## Medium\n- [ ] LC # — Title — Tags: — Why:\n\n## Hard\n- [ ] LC # — Title — Tags: — Why:\n\n## Expert\n- [ ] LC # — Title — Tags: — Why:'

copy_if_missing "$README_TEMPLATE" "$README_TARGET" "$README_STUB"
copy_if_missing "$PROBLEMS_TEMPLATE" "$PROBLEMS_TARGET" "$PROBLEMS_STUB"

echo "Initialized topic structure at: ${TARGET_DIR}"
