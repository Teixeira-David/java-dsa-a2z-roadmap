package a2z.dsa.arrays.kadane;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

import a2z.dsa.arrays.kadane.solutions.BestTimeToBuyAndSellStock;

/**
 * Unit test class for BestTimeToBuyAndSellStock.
 * Provides test cases to verify the correctness of maxProfit method in various scenarios.
 */
class BestTimeToBuyAndSellStockTest {

    private final BestTimeToBuyAndSellStock solver = new BestTimeToBuyAndSellStock();

    /**
     * Tests that maxProfit returns a non-zero value when later price is higher than initial price.
     *
     * @param prices Array of stock prices where the last element represents the current day's closing price.
     * @throws NullPointerException if input array is null.
     */
    @Test
    void profitIncreasesWhenLaterPriceHigher() {
        assertEquals(5, solver.maxProfit(new int[]{7, 1, 5, 3, 6, 4}));
    }

    /**
     * Verifies that maxProfit returns zero when all prices are in descending order.
     *
     * @param prices Array of stock prices where the last element represents the current day's closing price.
     * @throws NullPointerException if input array is null.
     */
    @Test
    void returnsZeroWhenSortedDescending() {
        assertEquals(0, solver.maxProfit(new int[]{5, 4, 3, 2, 1}));
    }

    /**
     * Ensures that maxProfit returns zero when there is only one trading day.
     *
     * @param prices Array of stock prices where the last element represents the current day's closing price.
     * @throws NullPointerException if input array is null.
     */
    @Test
    void handlesSingleDayReturnsZero() {
        assertEquals(0, solver.maxProfit(new int[]{10}));
    }

    /**
     * Tests that maxProfit handles a null input safely and returns zero.
     */
    @Test
    void handlesNullInputSafely() {
        assertEquals(0, solver.maxProfit(null));
    }

    /**
     * Verifies that maxProfit ignores repeated values in the price array and still calculates profit correctly.
     *
     * @param prices Array of stock prices where the last element represents the current day's closing price.
     * @throws NullPointerException if input array is null.
     */
    @Test
    void ignoresRepeatedValues() {
        assertEquals(2, solver.maxProfit(new int[]{3, 3, 5, 0, 0, 2}));
    }

    /**
     * Tests that maxProfit returns zero when given an empty array.
     *
     * @param prices Array of stock prices where the last element represents the current day's closing price.
     * @throws NullPointerException if input array is null.
     */
    @Test
    void handlesEmptyArray() {
        assertEquals(0, solver.maxProfit(new int[]{}));
    }

    /**
     * Verifies that maxProfit returns zero when all stock prices are the same.
     *
     * @param prices Array of stock prices where the last element represents the current day's closing price.
     * @throws NullPointerException if input array is null.
     */
    @Test
    void handlesAllSameValues() {
        assertEquals(0, solver.maxProfit(new int[]{4, 4, 4, 4}));
    }

    /**
     * Tests that maxProfit returns zero when there is no valid buy-sell scenario.
     *
     * @param prices Array of stock prices where the last element represents the current day's closing price.
     * @throws NullPointerException if input array is null.
     */
    @Test
    void handlesNoValidBuySellScenario() {
        assertEquals(0, solver.maxProfit(new int[]{10, 9, 8, 7, 6, 5}));
    }

    /**
     * Verifies that maxProfit correctly calculates profit when prices include negative values.
     *
     * @param prices Array of stock prices where the last element represents the current day's closing price.
     * @throws NullPointerException if input array is null.
     */
    @Test
    void handlesNegativePrices() {
        assertEquals(5, solver.maxProfit(new int[]{-3, -2, -1, 0, 2, 2}));
    }
}
