# Problems

## Easy
- [ ] LC 121 — Best Time to Buy and Sell Stock — Tags: single-pass, min tracking — Why: build the habit of scanning once, tracking the lowest prefix, and computing profit in place.
  - Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
  - Testing focus: rising sequence, non-profitable window, single-day input
- [ ] LC 169 — Majority Element — Tags: counting, Boyer-Moore — Why: demonstrates prefix accumulation and early exit for guaranteed majority.
  - Link: https://leetcode.com/problems/majority-element/
  - Testing focus: majority at start/middle/end, minimal length

## Medium
- [ ] LC 15 — 3Sum — Tags: two pointers, sorting, dedup — Why: canonical for sorted two-pointer sweeps after array sorting.
  - Link: https://leetcode.com/problems/3sum/
  - Testing focus: handling duplicates, zero-sum vs no-solution cases
- [ ] LC 209 — Minimum Size Subarray Sum — Tags: sliding window, variable window — Why: reinforces shrinking windows and prefix-sum target detection.
  - Link: https://leetcode.com/problems/minimum-size-subarray-sum/
  - Testing focus: exact target, cumulative overshoot, impossible target

## Hard
- [ ] LC 42 — Trapping Rain Water — Tags: prefix max, two pointers — Why: combines prefix/suffix knowledge with pointer convergence for area computation.
  - Link: https://leetcode.com/problems/trapping-rain-water/
  - Testing focus: multiple pits, flat plateaus, monotonically rising walls
