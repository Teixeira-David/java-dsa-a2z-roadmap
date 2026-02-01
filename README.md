# Java DSA A2Z Roadmap (Foundations → Advanced)

A public, interview-focused Java roadmap that starts from **core Java fluency** and progresses through canonical DSA topics (arrays → dp → graphs/trie). Each topic pairs curated checklists, idiomatic Java solutions, and JUnit coverage so the project doubles as a study guide and portfolio artifact.

---

## Quick start

1. Run the JVM suite so everything compiles:
   ```bash
   mvn test
   ```
2. Scaffold (or rehydrate) a canonical subtopic module:
   ```bash
   bash automation/scripts/init-topic.sh arrays kadane
   bash automation/scripts/init-topic.sh dp subsequence
   ```
3. Choose the next canonical problem via Fabric:
   ```bash
   bash automation/scripts/pick-next.sh arrays easy "121" "Prefer two pointers / greedy scan"
   ```
4. Explore similar canonical follow-ups:
   ```bash
   bash automation/scripts/pick-similar.sh 1 "Two Sum" 5 ""
   ```
5. Get a repo-local Big-O review:
   ```bash
   bash automation/scripts/big-o.sh src/main/java/a2z/dsa/arrays/solutions/BestTimeToBuyAndSellStock.java
   ```

## Directory structure

- `src/main/java/a2z/foundations/` — core Java notes, micro-examples, and language fluency checkpoints before DSA.
- `src/main/java/a2z/dsa/<topic>/<subtopic>/` — canonical subtopic modules that contain `README.md`, `problems.md`, and `solutions/`. Heavy techniques (e.g., `arrays/prefixsum`, `dp/subsequence`, `graphs/topo`) are treated as such subtopics.
- `src/main/java/a2z/showcase/` — polished showcase solutions + strong tests.
- `src/test/java/a2z/dsa/<topic>/` — topic-specific JUnit suites (base + edge cases flagged in the topic README).

## Topic workflow

1. Run `automation/scripts/pick-next.sh` to get the next canonical problem based on topic/tier.
2. Track that choice in `src/main/java/a2z/dsa/<topic>/<subtopic>/problems.md` (checkbox, tags, why it matters).
3. Implement the solution in `src/main/java/a2z/dsa/<topic>/<subtopic>/solutions/` and mirror tests under `src/test/java/a2z/dsa/<topic>/`.
4. Run `mvn test` to validate the change.
5. Mark the problem done in the topic checklist and optionally capture progress in `docs/progress.md`.

## Automation layer

- Patterns reside under `automation/fabric/patterns/<pattern>/system.md` (examples: `pick_next_leetcode_problem`, `similar_problems_from_index`, `big_o_review`, `plan_intake`).
- Scripts can be piped with LeetCode index data via the repo-local Fabric config:
- `automation/scripts/init-topic.sh` — scaffolds a canonical subtopic under `<topic>/<subtopic>/`.
  - `automation/scripts/pick-next.sh` — selects the next canonical problem for a target folder/tier.
  - `automation/scripts/pick-similar.sh` — returns `N` canonical problems related to a target problem.
  - `automation/scripts/big-o.sh` — runs `big_o_review` on a solution file.
  - `automation/scripts/update-pattern.sh` — inspects or installs the repo’s patterns into `~/.config/fabric`.
- Fabric uses the repo-local config tree owned by the scripts. To configure vendors & default model without polluting your home directory:
  ```bash
  HOME="$(git rev-parse --show-toplevel)/automation" fabric --setup
  ```

## Docs + templates

- `docs/convention.md`, `docs/roadmap.md`, and `docs/progress.md` explain curriculum expectations, automation goals, and progress tracking.
- `docs/templates/` hosts scaffolds such as `topic-readme.md`, `problem-entry.md`, and `solution-header.md` that `init-topic.sh` copies when creating a new topic module.

## Testing guidance

- Run the full suite with `mvn test`.
- Add topic-specific tests inside `src/test/java/a2z/dsa/<topic>/` targeting base cases, tricky bounds, and invariants mentioned in each topic README.
