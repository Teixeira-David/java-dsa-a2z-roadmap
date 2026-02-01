<!-- Track completion status and blockers for each stage -->

## Recent updates
- 2026-01-30: Added templates (`topic-readme.md`, `problem-entry.md`, `solution-header.md`) and scaffolded README stubs for every topic and foundation section.
- 2026-01-31: Implemented `Big O` review automation prompt and helper script to analyze code without overwriting it.

## Stage tracker
| Stage | Description | Status | Next milestone |
| --- | --- | --- | --- |
| Foundations | Java setup → recursion notes + micro-examples/tests | ⚪️ In progress | Add examples/tests for first two modules |
| DSA topics | `src/main/java/a2z/dsa/<topic>/<subtopic>` README + problems + solutions/tests (arrays-first) | 🔵 Started | Complete arrays checklist & add second topic solution |
| Showcase | Selection criteria set; to be populated once topics finish | ⚪️ Idle | Promote first array/tree solution |
| Automation | Fabric prompts/scripts enforced; `big_o_review` and `big-o.sh` added | 🟢 Ready | Audit `similar_problem` duplicate prompt |

## Blockers / notes
- Need to confirm which canonical LeetCode problems map to each topic before bulk populating `problems.md`.
- Maven tests currently fail because of `.m2` permissions; monitor once workspace config changes.
