PROJECT
-------
Repo: java-dsa-a2z-roadmap
Focus for this task: automation layer
 - automation/fabric/patterns/*/system.md (Fabric prompts)
- automation/scripts/*.sh (bash scripts)

CONTEXT
-------
This repo uses Fabric to curate canonical LeetCode-style problems from https://leetcode.ca/all/problems.html.
The scripts MUST run Fabric using repo-local prompts via XDG_CONFIG_HOME, not ~/.config.

I need you (Codex) to review the following folder tree:

automation/
  fabric/patterns/
    code_review/system.md
    pick_next_leetcode_problem/system.md
    plan_intake/system.md
    portfolio_writeup/system.md
    similar_problems_from_index/system.md
  scripts/
    init-topic.sh
    pick-next.sh
    pick-similar.sh
    update-pattern.sh

NEW OBJECTIVE
-------------
I want to add (or extend) a Fabric prompt that produces a "Big-O analysis + refactor suggestions" report for whatever Java code I paste into it.

Key: The prompt must analyze the current code complexity and propose ways to improve (ideally toward O(1) extra space / O(n) time where possible), but it MUST NOT overwrite my code.
It should output patch-style suggestions and specific refactor guidance.

Your job:
1) Audit the automation layer for correctness and consistency.
2) Identify naming mistakes / duplicates (e.g., similar_problem_from_index vs similar_problems_from_index).
3) Confirm scripts correctly force repo-local Fabric patterns via XDG_CONFIG_HOME.
4) Propose a new Fabric prompt file: big_o_review/system.md (or similar) with a strict output format for:
   - time complexity
   - space complexity
   - bottleneck loops / hot spots
   - suggestions to reduce time/space
   - when O(1) is impossible, explain why (with lower-bound reasoning)
   - patch-style snippets (small deltas), NOT full rewrites
5) Provide any minimal script changes needed to support the new prompt (optional).

CONSTRAINTS
-----------
- Do NOT dump full file contents unless the file is small.
- Do NOT overwrite my Java code in the output.
- Provide patch-style edits/snippets only.
- If you recommend "O(1)" improvements, be precise: clarify whether this is O(1) extra space vs O(1) time (rare).
- If O(1) time is impossible, explicitly say so and give the best realistic target (usually O(n) or O(n log n)).

DELIVERABLES (STRICT OUTPUT FORMAT)
-----------------------------------
1) AUTOMATION AUDIT
- Findings on patterns folder (missing/duplicate/typos)
- Findings on scripts folder (XDG_CONFIG_HOME usage, robustness)
- Fix recommendations (minimal)

2) NEW PROMPT: big_o_review/system.md
- Provide the full contents of the new prompt file (this is allowed even if “full file” because it’s small)
- Include strict output format for the prompt’s generated report

3) OPTIONAL: SCRIPT SUPPORT
- If needed, provide a minimal bash script (or patch snippet) to run:
  { code } | fabric -p big_o_review
- Ensure it uses repo-local patterns with XDG_CONFIG_HOME

START
-----
1) Inspect all files in automation/fabric/patterns and automation/scripts.
2) Then produce the deliverables above.
