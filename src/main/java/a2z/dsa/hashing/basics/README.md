# Topic

## Done means...
- [ ] I can explain the core patterns
- [ ] I can bootstrap the solution from scratch in Java
- [ ] I can list invariants + guard cases
- [ ] I can outline time/space complexity
- [ ] I have runner tests for base + edge inputs

## Complement Lookup (Two Sum pattern)
- **Core idea:** store each seen value and its index in a `HashMap<Integer, Integer>`, then for each new element ask "have I already seen `target - x`?" If yes, the current index plus the stored index form the solution pair.
- **Why it works:** the invariant is that every processed value is recorded before its complement is needed, so a single left-to-right pass yields the first solution without revisiting any element.
- **Complexity:** time `O(n)` (one pass through the array), space `O(n)` for the map of seen values.
- **Edge cases:** handle duplicates cleanly, accept negative and zero values, never use the same index twice (skip when complement equals current but map entry points to same index), and trust the problem guarantee that exactly one solution exists.

## Java notes
- Use `HashMap<Integer, Integer>` to map values → indices instead of arrays for quick lookups.
- Watch for autoboxing overhead when storing primitives; avoid unnecessary conversions in the hot path.
- LeetCode expects `int[]` return values (e.g., `return new int[]{idx, prevIdx};`), so keep the API shape consistent.

## Current work-in-progress
- ✅ `Two Sum` solution + `TwoSumTest` exercise the complement lookup pattern, covering duplicates, negative numbers, and unreachable targets.

## Patterns checklist
- [ ] ...

## Minimum canonical problems
See `problems.md`.
