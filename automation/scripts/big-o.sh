#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
REPO_FABRIC_HOME="$REPO_ROOT/automation"
FABRIC_ROOT="$REPO_FABRIC_HOME"
export XDG_CONFIG_HOME="$REPO_FABRIC_HOME"
FABRIC_CONFIG_DIR="$REPO_FABRIC_HOME/.config/fabric"
mkdir -p "$FABRIC_CONFIG_DIR/patterns"
cp -R "$REPO_FABRIC_HOME/fabric/patterns/." "$FABRIC_CONFIG_DIR/patterns/"
touch "$FABRIC_CONFIG_DIR/.env"

pattern="big_o_review"
lang="java"
goal="reduce extra space to O(1) when possible; otherwise explain limits"
notes=""
output_file=""
input_file=""

usage() {
  cat <<'EOF' >&2
Usage: big-o.sh [options] [path/to/Solution.java]

Modes:
  1) pipe code in: cat path/to/Solution.java | big-o.sh
  2) pass file:    big-o.sh path/to/Solution.java

Options:
  -p <pattern_name>    Fabric prompt base name (default: big_o_review)
  --lang <language>    Language label for metadata (default: java)
  --goal <goal>        Optimization goal text (default: reduce extra space to O(1)...)
  --notes "<text>"     Additional context appended to metadata (optional)
  -o <file>            Write Fabric output to <file> (still prints to stdout)
  -h, --help           Show this message

Examples:
  big-o.sh src/main/java/a2z/dsa/arrays/solutions/BestTimeToBuyAndSellStock.java
  cat Solution.java | big-o.sh --notes "work in progress, focus on space"
EOF
  exit 1
}

require_arg() {
  local opt="$1"
  local val="${2:-}"
  if [[ -z "$val" ]]; then
    echo "Missing argument for $opt" >&2
    usage
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -p)
      require_arg "-p" "$2"
      pattern="$2"
      shift 2
      ;;
    --lang)
      require_arg "--lang" "$2"
      lang="$2"
      shift 2
      ;;
    --goal)
      require_arg "--goal" "$2"
      goal="$2"
      shift 2
      ;;
    --notes)
      require_arg "--notes" "$2"
      notes="$2"
      shift 2
      ;;
    -o)
      require_arg "-o" "$2"
      output_file="$2"
      shift 2
      ;;
    -h|--help)
      usage
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage
      ;;
    *)
      if [[ -n "$input_file" ]]; then
        echo "Only one file path is allowed." >&2
        usage
      fi
      input_file="$1"
      shift
      ;;
  esac
done

if [[ -z "$input_file" && -t 0 ]]; then
  echo "No input file or piped code detected." >&2
  usage
fi

if [[ -n "$input_file" && ! -r "$input_file" ]]; then
  echo "Cannot read file: $input_file" >&2
  exit 1
fi

patterns_dir="${FABRIC_ROOT}/fabric/patterns"
prompt_base="${pattern%%.*}"
pattern_dir="${patterns_dir}/${prompt_base}"

if [[ ! -d "$pattern_dir" ]]; then
  echo "Fabric prompt '${prompt_base}' not found under ${patterns_dir}/" >&2
  exit 1
fi

pattern_for_fabric="$prompt_base"

print_metadata() {
  cat <<EOF
METADATA
LANGUAGE: $lang
GOAL: $goal
OPTIONAL_NOTES: $notes
END_METADATA
EOF
}

run_pipeline() {
  print_metadata
  if [[ -n "$input_file" ]]; then
    cat "$input_file"
  else
    cat
  fi
}

if [[ -n "$output_file" ]]; then
  run_pipeline | HOME="$REPO_FABRIC_HOME" fabric -p "$pattern_for_fabric" | tee "$output_file"
else
  run_pipeline | HOME="$REPO_FABRIC_HOME" fabric -p "$pattern_for_fabric"
fi
