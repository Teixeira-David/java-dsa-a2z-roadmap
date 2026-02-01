package a2z.dsa.hashing.basics.solutions;

import java.util.HashMap;

/**
 * Solves the two-sum problem for a given array of integers.
 *
 * Given an integer array `nums` and an integer `target`, returns an array containing the indices of two numbers in `nums`
 * that add up to `target`. If no such pair exists, returns an array with default values ({0, 0}).
 *
 * @author [Your Name]
 */
public class TwoSum {

    /**
     * Solves the two-sum problem for a given array of integers.
     *
     * @param nums   the input array of integers (must have at least 2 elements)
     * @param target the target sum value
     * @return an array containing the indices of two numbers in `nums` that add up to `target`, or default values ({0, 0}) if no pair exists
     */
    public int[] twoSum(int[] nums, int target) {
        int[] defaultResult = {0, 0};

        // Handle null or insufficient input
        if (nums == null || nums.length < 2) {
            return defaultResult;
        }

        HashMap<Integer, Integer> numToIndex = new HashMap<>(); // Create a hash map to store the numbers and their indices
        int bestFirst = Integer.MAX_VALUE; // To track the best (smallest) first index found
        int bestSecond = Integer.MAX_VALUE; // To track the best (smallest) second index found

        for (int i = 0; i < nums.length; i++) {
            int x = nums[i];
            int y = target - x; // Calculate the complement of 'x' with respect to the target

            // Check if the complement exists in the map
            Integer complementIndex = numToIndex.get(y);
            if (complementIndex != null) {
                if (complementIndex < bestFirst || (complementIndex == bestFirst && i < bestSecond)) {
                    bestFirst = complementIndex;
                    bestSecond = i;
                }
            }
            numToIndex.putIfAbsent(x, i);
        }

        // Return the best pair found, if any
        if (bestFirst != Integer.MAX_VALUE) {
            return new int[] { bestFirst, bestSecond };
        }
        // Return default when no pair exists
        return defaultResult;
    }
}
