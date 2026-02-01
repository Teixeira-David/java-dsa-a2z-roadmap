# Repository conventions (starter notes)

1. **Structure first** — keep `src/main/java/a2z/{foundations,dsa,showcase}` aligned with the taxonomy and ensure each subtopic lives under `src/main/java/a2z/dsa/<topic>/<subtopic>/README.md`, `problems.md`, and `solutions/` before adding code. Use `automation/scripts/init-topic.sh <topic> <subtopic>` to scaffold that module + templates.
2. **High-signal content only** — write clear approach bullets, complexity, and edge-case callouts in the solution header before the code; include focused JUnit tests in `src/test/java/a2z/` alongside each topic.
3. **Automation hygiene** — always run Fabric through the scripts in `automation/scripts/` so `XDG_CONFIG_HOME` is fixed to `automation/` and Fabric patterns stay repo-local.
4. **Templates** — seed new topics with `docs/templates/topic-readme.md`, `problem-entry.md`, and `solution-header.md` to keep documentation consistent.
5. **Recruiter-ready focus** — this repo is a portfolio; emphasize readability, correctness, and testability over quantity of problems.
