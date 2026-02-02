package a2z.dsa.arrays.two_pointers;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Timeout;

import a2z.dsa.arrays.two_pointers.solutions.TwoSumIIInputArrayIsSorted;

@Timeout(value = 200, unit = TimeUnit.MILLISECONDS)
class TwoSumIIInputArrayIsSortedTest {

    private final TwoSumIIInputArrayIsSorted solver = new TwoSumIIInputArrayIsSorted();

    @Test
    void findsStandardPair() {
        int[] numbers = {2, 7, 11, 15};
        int target = 9;
        assertArrayEquals(new int[] {1, 2}, solver.twoSum(numbers, target));
    }

    @Test
    void handlesNegativeNumbers() {
        int[] numbers = {-3, -1, 0, 2};
        int target = -3;
        assertArrayEquals(new int[] {1, 3}, solver.twoSum(numbers, target));
    }

    @Test
    void handlesDuplicates() {
        int[] numbers = {1, 2, 2, 3};
        int target = 5;
        assertArrayEquals(new int[] {2, 4}, solver.twoSum(numbers, target));
    }

    @Test
    void handlesNullInput() {
        assertArrayEquals(new int[] {0, 0}, solver.twoSum(null, 5));
    }

    @Test
    void handlesEmptyArray() {
        assertArrayEquals(new int[] {0, 0}, solver.twoSum(new int[] {}, 5));
    }

    @Test
    void handlesTargetOutOfRangeLower() {
        int[] numbers = {1, 2, 3};
        assertArrayEquals(new int[] {0, 0}, solver.twoSum(numbers, -5));
    }

    @Test
    void handlesTargetOutOfRangeUpper() {
        int[] numbers = {1, 2, 3};
        assertArrayEquals(new int[] {0, 0}, solver.twoSum(numbers, 10));
    }

    @Test
    void handlesMinimalLength() {
        int[] numbers = {1, 1};
        int target = 2;
        assertArrayEquals(new int[] {1, 2}, solver.twoSum(numbers, target));
    }
}
