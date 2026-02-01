package a2z.dsa.arrays.kadane.solutions;

/**
 * Calculates the maximum possible profit from buying and selling a stock once.
 *
 * @param prices an array of stock prices where {@code i} is the day (0-indexed) and the value at that index is the price on that day
 * @return the maximum possible profit, or 0 if no profit can be made
 */
public class BestTimeToBuyAndSellStock {
    public int maxProfit(int[] prices) {
        if (prices == null || prices.length <= 1) {
            return 0;
        }

        int minPrice = prices[0];
        int maxProfit = 0;

        for (int i : prices) {
            maxProfit = Math.max(maxProfit, i - minPrice);
            minPrice = Math.min(minPrice, i);
        }

        return maxProfit;
    }
}
