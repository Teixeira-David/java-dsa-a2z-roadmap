# Showcase

This directory is the recruiter-friendly highlight reel. Each entry here must:
- Include a Java solution file with the header format defined in `docs/templates/solution-header.md`.
- Be accompanied by a reflective writeup (approach, invariants, time/space) and 5+ focused tests (base + adversarial).
- Emphasize clarity over quantity: pick the best 10–15 canonical problems across the roadmap.

## Entry criteria
1. Topic readiness: the parent topic must have a README + `problems.md` describing the pattern before its solution graduates to showcase.
2. Testing rigor: each showcase test suite must cover null/empty cases, performance edge cases, and a randomized/brute-force comparator when possible.
3. Automation alignment: every showcased solution should mention the canonical LeetCode ID + difficulty and relate back to a pattern from the roadmap.

## How to publish
- Commit the topic’s canonical version first (`solutions/` + `src/test/`).
- Copy the final version into `src/main/java/a2z/showcase/` and keep the README header updated with tags + invariants.
- Keep the list short; when adding a new entry, consider retiring one that is less polished to maintain the 10–15 target.
Refer back to this document before moving topic solutions into the showcase folder so the recruiters see only the very best code.
