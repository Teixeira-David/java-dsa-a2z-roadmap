# AGENTS.md — Java DSA A2Z Roadmap Repo (Codex Agent Guide)

## PROJECT: What this repo is
This repository is a public, interview-focused **Java roadmap** that progresses from **core Java foundations** to **advanced data structures and algorithms** (graphs, tries, dynamic programming). It is designed as a curriculum and portfolio artifact:

- **Foundations track**: short notes + runnable micro-examples for essential Java fluency before DSA.
- **DSA track**: curated canonical problems (primarily LeetCode-indexed) organized by topic folders.
- **Showcase track**: a small set of polished solutions demonstrating interview readiness.
- **Automation layer**: Fabric prompts + bash scripts that select canonical problems from the leetcode.ca index and generate “similar problems” sets.

The repo is not intended to be a dumping ground of 400+ random solutions. It is a structured, navigable body of work that prioritizes:
- pattern coverage,
- correctness,
- testability,
- and clarity.

---

## CORE GOALS
1) Provide a **complete learning path**: Java basics → advanced DP/graphs.
2) Maintain **high-signal structure**: each topic folder is self-contained with:
   - `README.md` (patterns + “done means” checklist),
   - `problems.md` (curated canonical checklist with links),
   - `solutions/` (1 file per solution),
   - `src/test` mirror tests for non-trivial problems.
3) Ensure the codebase is **runnable**: `mvn test` should pass consistently.
4) Keep prompts/scripts **versioned in-repo**; keep credentials/config out of the repo.

---

## SCOPE: What this repo covers (topic taxonomy)
### A) Foundations (before DSA)
Path: `src/main/java/a2z/foundations/`
Includes:
- Environment setup notes (JDK, Maven)
- Language basics (types, control flow, arrays)
- OOP basics (classes, interfaces, inheritance)
- Strings core (`String`, `StringBuilder`, `.equals` vs `==`)
- Collections core (`HashMap`, `HashSet`, `ArrayDeque`, `PriorityQueue`)
- Comparators & sorting patterns
- Complexity intuition (Big-O, amortized)
- Recursion mechanics (stack depth, base cases)

### B) DSA Topics
Path: `src/main/java/a2z/dsa/`
Folders:
- `basics`, `math`, `hashing`, `sorting`, `arrays`, `binarysearch`, `strings`, `linkedlist`,
  `recursion`, `bit`, `stackqueue`, `slidingwindow`, `heaps`, `greedy`, `trees`, `bst`,
  `graphs`, `dp`, `trie`

### C) Showcase
Path: `src/main/java/a2z/showcase/`
Contains ~10–15 highly-polished solutions: clean writeups + strong tests + clear invariants.

### D) Automation (Fabric)
Path: `automation/`
- `automation/fabric/patterns/`: Fabric prompts (tracked)
- `automation/scripts/`: bash scripts (tracked)
- `automation/output/`: generated local output (ignored, except `.gitkeep`)

Automation uses the canonical LeetCode index:
- https://leetcode.ca/all/problems.html

---

## NON-GOALS (Out of scope)
- No web app, no UI, no Spring Boot backend.
- No massive dependency stack (keep Maven minimal).
- Do not implement non-canonical “random” problems as core curriculum items.
- Do not store any API keys, provider config, or personal Fabric settings in this repo.

---

## AGENT RESPONSIBILITIES: How to evaluate scope and make changes
When asked to add content or modify this project, evaluate the request through these gates:

### Gate 1: Where does this change belong?
- **Foundations**: concepts, examples, Java language/tooling knowledge.
- **DSA topic folder**: problem lists, solution implementations, tests, topic notes.
- **Showcase**: only best-of solutions with excellent tests and explanations.
- **Automation**: Fabric prompt improvements, bash scripts, curriculum selection logic.
- **Docs**: templates, conventions, repo-level guidelines.

### Gate 2: Does it preserve navigability?
Every topic folder should remain:
- easy to skim,
- internally consistent,
- and not overloaded.

Prefer “pattern subfolders” for large topics (dp, graphs, slidingwindow, binarysearch, trees).

### Gate 3: Does it raise the quality bar?
Changes should improve at least one of:
- correctness & edge-case handling,
- explanation clarity (invariants / monotonic predicates / DP state),
- tests (JUnit),
- organization (no duplicates, clean mapping),
- automation reliability.

If a change adds code but no clarity/tests/structure, it is likely not aligned.

### Gate 4: Is it canonical and curriculum-aligned?
Problems should be selected from canonical lists (LeetCode IDs/titles) and appear in `problems.md`.
If adding a new problem:
- Put it in the correct topic based on the core technique.
- Avoid duplicates across folders unless explicitly justified.

### Gate 5: Is it reproducible?
`mvn test` must pass.
Scripts should be deterministic and documented.

---

## CODE & DOCUMENTATION STANDARDS
### Solution file requirements (DSA)
Each solution must include at the top:
- Problem ID + Title + canonical link
- Primary pattern tag(s)
- Approach bullets (2–6)
- Complexity (time + space)
- Edge cases (bullets)

Implementation expectations:
- idiomatic Java,
- minimal unnecessary abstraction,
- avoid giant `main()` solutions,
- careful with `int` vs `long`,
- use `ArrayDeque` over `Stack`,
- comparators must be correct and safe.

### Tests (JUnit 5)
Write tests for:
- binary search bounds/edge cases,
- sliding window invariants,
- graph traversal correctness,
- DP correctness across base/edge cases,
- tricky recursion/backtracking branches.

Aim for:
- 5–10 tests for “important” problems,
- include adversarial edge cases,
- optional randomized tests for small N vs brute force.

---

## DIRECTORY RULES
- Do not move or rename top-level tracks without updating root `README.md`.
- For each topic:
  - must contain `README.md` + `problems.md`
  - solutions belong under `solutions/` or pattern subfolders
- Keep automation prompts in:
  - `automation/fabric/patterns/`
- Keep scripts in:
  - `automation/scripts/`
- Do not commit generated outputs:
  - `automation/output/**` (except `.gitkeep`)

---

## AUTOMATION BEHAVIOR (Fabric prompts + scripts)
The repo supports two key automation flows:

1) **Pick next problem** by topic + tier:
   - Input: topic, tier, solved IDs
   - Source: leetcode.ca index content
   - Output: one recommended next canonical problem + rationale + edge-case checklist

2) **Pick similar problems**:
   - Input: target problem ID/title + count
   - Output: N canonical problems with the same core pattern + progression and optional variants

Agent changes to prompts/scripts must:
- keep strict input/output formats,
- preserve topic→pattern mapping,
- avoid inventing problems not present in the index when in “canonical selection” mode.

---

## EXPECTED ARTIFACTS FOR COMMON TASKS
### Task: “Add a new topic folder”
- Create folder under `src/main/java/a2z/dsa/<topic>/`
- Add `README.md` using the topic template
- Add `problems.md` with a minimal canonical set
- Add empty `solutions/` directory (or pattern subfolders)

### Task: “Add problems for a topic”
- Update `problems.md` with:
  - tiers (Easy/Medium/Hard/Expert),
  - checkboxes,
  - links and pattern tags,
  - a short “why this matters” line.
- Add 1–2 tests for the hardest/trickiest items.

### Task: “Improve repo onboarding”
- Update root `README.md`:
  - clear setup instructions,
  - running tests,
  - automation usage examples,
  - topic index and showcase links.

---

## OUTPUT CONSTRAINTS FOR THE AGENT
When implementing changes:
- Prefer **small, targeted patches**.
- Do **not** output entire files unless explicitly requested.
- Provide:
  1) plan,
  2) list of files changed/created,
  3) key snippets or diffs,
  4) any commands to run/verify (`mvn test`, script invocation).

---

## SUCCESS CRITERIA
A change is successful if:
- The repo stays navigable and curriculum-aligned,
- Canonical problem selection stays consistent,
- `mvn test` passes,
- Solutions remain idiomatic Java with clear explanations,
- Tests and writeups increase confidence and signal.


