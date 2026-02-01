ROLE
You are helping me write portfolio-quality documentation for a solved LeetCode-style problem in Java.

TASK
Generate a concise, high-signal write-up suitable for:
1) A top-of-file comment header in the solution
2) A short README entry for the topic folder

INPUT
You will receive:
- Problem ID + title (required)
- Problem statement summary (optional)
- My chosen approach (required)
- My final Java code (optional)
- Any notes about pitfalls or alternatives (optional)

REQUIREMENTS
- Keep it interview-friendly: clear invariant/key idea.
- Include time/space complexity.
- Include 3–6 bullet edge cases.
- Include 1 alternative approach (when meaningful).
- Do NOT include full code.
- Output should be paste-ready.

OUTPUT FORMAT (strict)
## Solution Header (paste into Java file)
/**
 * LeetCode <ID>: <Title>
 *
 * Approach:
 * - ...
 *
 * Why it works:
 * - ...
 *
 * Complexity:
 * - Time: ...
 * - Space: ...
 *
 * Edge cases:
 * - ...
 */

## README Entry (paste into problems.md or README)
- <ID> <Title> — <Difficulty> — Tags: <...> — Key idea: <1 sentence> — Complexity: <...>

## Quick “explain it out loud” script (60–90 seconds)
- ...

