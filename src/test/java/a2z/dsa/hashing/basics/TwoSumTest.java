package a2z.dsa.hashing.basics;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

import a2z.dsa.hashing.basics.solutions.TwoSum;

/**
 * Test class for TwoSum solution.
 *
 * This class contains unit tests to validate the correctness of the TwoSum solution.
 * It covers various edge cases such as null input, array with less than two elements,
 * empty array input, multiple pairs found, negative numbers, unreachable target, and large numbers.
 */
class TwoSumTest {

    private final TwoSum solver = new TwoSum();

    /**
     * Tests if the TwoSum solver can find two sum pairs correctly.
     *
     * @param nums an array of integers to find pairs from
     * @param target the target sum value
     */
    @Test
    void findsTwoSumPairsCorrectly() {
        int[] nums = {2, 7, 11, 15};
        int target = 9;
        int[] result = solver.twoSum(nums, target);
        assertEquals(0, result[0]);
        assertEquals(1, result[1]);
    }

    /**
     * Tests if the TwoSum solver returns an empty map when no pairs are found.
     *
     * @param nums an array of integers to find pairs from
     * @param target the target sum value
     */
    @Test
    void returnsEmptyMapWhenNoPairsFound() {
        int[] nums = {1, 2, 3, 4};
        int target = 8;
        int[] result = solver.twoSum(nums, target);
        assertEquals(0, result[0]);
        assertEquals(0, result[1]);
    }

    /**
     * Tests if the TwoSum solver handles null input safely.
     *
     * @param nums an array of integers to find pairs from (null in this test)
     */
    @Test
    void handlesNullInputSafely() {
        int[] result = solver.twoSum(null, 5);
        assertEquals(0, result[0]);
        assertEquals(0, result[1]);
    }

    /**
     * Tests if the TwoSum solver can handle an array with less than two elements.
     *
     * @param nums an array of integers to find pairs from (less than two elements in this test)
     */
    @Test
    void handlesArrayWithLessThanTwoElements() {
        int[] nums = {5};
        int[] result = solver.twoSum(nums, 5);
        assertEquals(0, result[0]);
        assertEquals(0, result[1]);
    }

    /**
     * Tests if the TwoSum solver can handle an empty array input.
     *
     * @param nums an array of integers to find pairs from (empty in this test)
     */
    @Test
    void handlesEmptyArrayInput() {
        int[] nums = {};
        int[] result = solver.twoSum(nums, 5);
        assertEquals(0, result[0]);
        assertEquals(0, result[1]);
    }

    /**
     * Tests if the TwoSum solver can find multiple pairs correctly.
     *
     * @param nums an array of integers to find pairs from
     * @param target the target sum value
     */
    @Test
    void findsMultiplePairsCorrectly() {
        int[] nums = {3, 2, 4, 3};
        int target = 6;
        int[] result = solver.twoSum(nums, target);
        assertEquals(0, result[0]);
        assertEquals(3, result[1]);
    }

    /**
     * Tests if the TwoSum solver can handle negative numbers correctly.
     *
     * @param nums an array of integers to find pairs from (negative numbers in this test)
     */
    @Test
    void handlesNegativeNumbersCorrectly() {
        int[] nums = {-1, -2, -3, -4, -5};
        int target = -8;
        int[] result = solver.twoSum(nums, target);
        assertEquals(2, result[0]);
        assertEquals(4, result[1]);
    }

    /**
     * Tests if the TwoSum solver can handle an unreachable target correctly.
     *
     * @param nums an array of integers to find pairs from
     * @param target the target sum value (unreachable in this test)
     */
    @Test
    void handlesUnreachableTargetCorrectly() {
        int[] nums = {1, 2, 3, 4, 5};
        int target = 10;
        int[] result = solver.twoSum(nums, target);
        assertEquals(0, result[0]);
        assertEquals(0, result[1]);
    }

    /**
     * Tests if the TwoSum solver can handle large numbers correctly.
     *
     * @param nums an array of integers to find pairs from (large numbers in this test)
     * @param target the target sum value
     */
    @Test
    void handlesLargeNumbersCorrectly() {
        int[] nums = {1000000, 500000, 1000000};
        int target = 2000000;
        int[] result = solver.twoSum(nums, target);
        assertEquals(0, result[0]);
        assertEquals(2, result[1]);
    }

}
