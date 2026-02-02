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

- Patterns live at `automation/fabric/patterns/<pattern>/system.md` (see `pick_next_leetcode_problem`, `similar_problems_from_index`, `big_o_review`, `plan_intake`, etc.).
- Wrapper scripts mirror those patterns and copy them into `automation/.config/fabric/patterns/<pattern>` before invoking Fabric with `HOME="$(git rev-parse --show-toplevel)/automation"`.
  - `automation/scripts/init-topic.sh` — scaffold a canonical `<topic>/<subtopic>/`.
  - `automation/scripts/pick-next.sh` — stream the LeetCode index via TSV into `fabric -p pick_next_leetcode_problem`.
  - `automation/scripts/pick-similar.sh` — pipe TSV + metadata into `fabric -p similar_problems_from_index`.
  - `automation/scripts/big-o.sh` / `automation/scripts/big-o-discovery.sh` — run `fabric -p big_o_review` on a solution file.
  - `automation/scripts/code-review.sh` — feed diffs/files into `fabric -p code_review`.
  - `automation/scripts/plan-intake.sh` — send a short description to `fabric -p plan_intake`.
  - `automation/scripts/portfolio-writeup.sh` — mix solution + problems with `fabric -p portfolio_writeup`.
- Fabric uses the repo-local config tree under `automation/.config/fabric/`. Configure vendors/models via:
  ```bash
  HOME="$(git rev-parse --show-toplevel)/automation" fabric --setup
  ```

  Once setup completes (check `automation/.config/fabric/.env` and `.../patterns/`), you can verify the repo-local catalog with:
  ```bash
  HOME="$(git rev-parse --show-toplevel)/automation" fabric -l
  ```

## Fabric automation (patterns + scripts)

1. **Big-O discovery**
   ```bash
   bash automation/scripts/big-o-discovery.sh src/main/java/a2z/dsa/arrays/kadane/solutions/BestTimeToBuyAndSellStock.java
   ```

2. **Code review**
   ```bash
   git diff HEAD~1 | HOME="$(git rev-parse --show-toplevel)/automation" fabric -p code_review
   ```

3. **Plan intake**
   ```bash
   cat <<'EOF' | HOME="$(git rev-parse --show-toplevel)/automation" fabric -p plan_intake
   Implement LC 167 (Two Sum II) in a2z/dsa/arrays/two_pointers with solution + tests.
   EOF
   ```

4. **Portfolio writeup**
   ```bash
   {
     cat src/main/java/a2z/dsa/arrays/two_pointers/solutions/TwoSumIIInputArrayIsSorted.java
     echo
     cat src/test/java/a2z/dsa/arrays/two_pointers/TwoSumIIInputArrayIsSortedTest.java
   } | HOME="$(git rev-parse --show-toplevel)/automation" fabric -p portfolio_writeup
   ```

### Troubleshooting
- `DEFAULT_VENDOR=, is not valid`: rerun the setup command above so Fabric records the configured vendor/model in `automation/.config/fabric/.env`.
- Patterns not found? confirm each `automation/fabric/patterns/<pattern>/system.md` exists and let the script copy it into `automation/.config/fabric/patterns/`.
- `timeout` command missing on macOS? install GNU coreutils (`brew install coreutils`) and use `gtimeout`, or rely on the JUnit `@Timeout` annotations already present.

## Docs + templates

- `docs/convention.md`, `docs/roadmap.md`, and `docs/progress.md` explain curriculum expectations, automation goals, and progress tracking.
- `docs/templates/` hosts scaffolds such as `topic-readme.md`, `problem-entry.md`, and `solution-header.md` that `init-topic.sh` copies when creating a new topic module.

## Testing guidance

- Run the full suite with `mvn test`.
- Add topic-specific tests inside `src/test/java/a2z/dsa/<topic>/` targeting base cases, tricky bounds, and invariants mentioned in each topic README.
