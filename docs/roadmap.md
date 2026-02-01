<!-- Detailed roadmap + milestones for the Java DSA A2Z curriculum -->

## Vision
- Foundations: cover JDK setup, language syntax, OOP, strings, collections, comparators, and recursion intuition so newcomers can code with confidence before solving DSA problems.
- DSA topics: each folder from `basics` through `trie` holds a README, canonical `problems.md`, disciplined `solutions/`, and mirror tests; pattern subfolders house heavy techniques (DP, graphs, sliding windows, etc.).
- Showcase: a recruiter-friendly spotlight of 10–15 best-in-class solutions with clear invariants, documented complexity, and robust tests.
- Automation: repo-local Fabric prompts + scripts keep canonical problem selection and review workflows reproducible and shareable.

## Stage breakdown
1. **Foundations checklist**
   - [ ] Validate tooling (`mvn test`, IDE setup).
   - [ ] Complete `README.md` + minimal examples/tests for each `src/main/java/a2z/foundations/0X_*`.
   - [ ] Document complexity intuition & comparator usage (`docs/templates` already set the format).
2. **DSA topic build-out**
   - [ ] For each topic (arrays, trees, graphs, dp, etc.), use `automation/scripts/init-topic.sh <topic> <subtopic>` to create a canonical `src/main/java/a2z/dsa/<topic>/<subtopic>/` module, then add the canonical problems and first solution/test pair.
   - [ ] Establish pattern subtopic folders for heavy techniques (e.g., `dp/subsequence`, `graphs/shortest_path`), each with their own README + `problems.md` inside `<topic>/<subtopic>/`.
   - [ ] Align `src/test/java/a2z/dsa/<topic>/` tests with the solutions living in the corresponding `<subtopic>/solutions/` directories so `mvn test` remains runnable per topic.
3. **Showcase grooming**
   - [ ] Select 10–15 polished problems (mix of easy/medium/hard) from completed topics.
   - [ ] Move recruiter-ready writeups + tests into `src/main/java/a2z/showcase/`.
   - [ ] Reference `showcase/README.md` for required invariants, testing rigor, and explanation style.
4. **Automation & Fabric hygiene**
   - [ ] Keep `automation/fabric/patterns/` prompts up to date (pick-next, pick-similar, big_o_review, etc.).
   - [ ] Ensure scripts always set `XDG_CONFIG_HOME` to `automation/`, as `automation/scripts/*` currently do.
   - [ ] Document how to run each helper script inside `docs/convention.md` or a dedicated automation doc.

## How to use this roadmap
- Update the checkboxes above when a stage completes and add dates/examples in `docs/progress.md`.
- Cross-link each topic’s `README.md` to this roadmap in the introduction so readers know where the path leads.
