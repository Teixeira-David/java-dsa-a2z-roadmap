# Java DSA A2Z Roadmap (Foundations → Advanced)

A public, interview-focused Java roadmap from **core Java foundations** through **advanced DSA** (graphs, tries, dynamic programming).
This repo is organized as a curriculum: each topic includes a pattern checklist, a curated canonical problem set, clean Java solutions, and JUnit tests.
Automation scripts (Fabric) help select the next canonical problems from the LeetCode index and generate “similar problem” sets for targeted practice.

---

## What’s inside

### 1) Java Foundations (before DSA)
Located under: `src/main/java/a2z/foundations/`

Covers:
- Big-O intuition and common complexity patterns
- Primitives vs objects (autoboxing pitfalls)
- Arrays vs ArrayList (mutability, resizing cost)
- Strings (`String` immutability, `StringBuilder`, `.equals` vs `==`)
- Collections essentials: `HashMap`, `HashSet`, `ArrayDeque`, `PriorityQueue`
- Comparators and ordering
- Recursion fundamentals (stack depth implications)

### 2) DSA Topics (A2Z)
Located under: `src/main/java/a2z/dsa/`

Topics:
- `basics`
- `math`
- `hashing`
- `sorting`
- `arrays`
- `binarysearch`
- `strings`
- `linkedlist`
- `recursion`
- `bit`
- `stackqueue`
- `slidingwindow`
- `heaps`
- `greedy`
- `trees`
- `bst`
- `graphs`
- `dp`
- `trie`

Each topic folder contains:
- `README.md` — “done means…”, patterns checklist, study notes
- `problems.md` — curated canonical checklist (links + tiers)
- `solutions/` — Java solutions (1 file per problem)
- Optional pattern subfolders (e.g., `/dp/subsequence`, `/graphs/topo`, etc.)

### 3) Showcase
Located under: `src/main/java/a2z/showcase/`

A small set of 10–15 highly polished solutions with strong writeups + tests. This is the “recruiter skim” entry point.

### 4) Automation (Fabric)
Located under: `automation/`

- `automation/fabric/patterns/` — Fabric prompts:
  - `pick_next_leetcode_problem.txt` (choose next canonical problem for a topic + tier)
  - `similar_problems_from_index.txt` (choose N problems similar to a target)
  - optional A/B/C/D prompts for planning, review, tests, writeups
- `automation/scripts/` — bash scripts that fetch the LeetCode index and pipe into Fabric:
  - `pick-next.sh`
  - `pick-similar.sh`

---

## How to run

### Requirements
- Java 17+
- Maven 3.9+ (or Maven Wrapper if you add it)

### Run tests
```bash
mvn test

