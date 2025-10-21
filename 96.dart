class Solution {
  int numTrees(int n) {
    List<int> dp = List.filled(n + 1, 0);
    dp[0] = 1; // empty tree
    dp[1] = 1; // single node tree

    for (int i = 2; i <= n; i++) {
      for (int j = 1; j <= i; j++) {
        dp[i] += dp[j - 1] * dp[i - j];
      }
    }

    return dp[n];
  }
}
