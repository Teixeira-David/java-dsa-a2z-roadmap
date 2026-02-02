# Two Pointers

## Purpose
- Capture sorted-array two-pointer walk, sliding window on sorted input, and complement-with-directional scan patterns.
- Track canonical problems where the array is already sorted so we can march inward/outward without extra space.

## Pattern focus
- Maintain `left` and `right` pointers that move toward each other, adjusting the sum vs. target using the sorted invariant.
- Use guard clauses to avoid out-of-bounds while the loop terminates when the pointers cross.

## Current status
- ✅ `Two Sum II - Input array is sorted` (LC 167) solution implemented in `solutions/TwoSumIIInputArrayIsSorted.java` with two-pointer scans and complete JUnit5 coverage in `src/test/java/a2z/dsa/arrays/two_pointers/TwoSumIIInputArrayIsSortedTest.java`.
- ✅ Tests cover duplicates, null/empty input, out-of-range targets, negative numbers, and minimal lengths while respecting the sorted invariants.
