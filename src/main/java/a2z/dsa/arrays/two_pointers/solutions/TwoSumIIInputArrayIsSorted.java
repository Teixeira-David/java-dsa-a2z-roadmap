package a2z.dsa.arrays.two_pointers.solutions;

public class TwoSumIIInputArrayIsSorted {

    /**
     * Returns the 1-based indices of the two numbers that add up to target.
     */
    public int[] twoSum(int[] nums, int target) {
        if (nums == null || nums.length == 0) {
            return new int[] {0, 0}; // Return [0, 0] for invalid input
        }

        int left = 0;
        int right = nums.length - 1;

        while (left < right) {
            int sum = nums[left] + nums[right];

            // First check if sum is equals to target
            if (sum == target) {
                return new int[] {left + 1, right + 1}; // Return 1-based indices
            }
            else if (sum < target) {
                left++;
            } else {
                right--;
            }
        }

        return new int[] {0, 0}; // Return [0, 0] if no solution is found
    }
}
