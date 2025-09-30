class Solution {
  int uniquePaths(int m, int n) {
    int N = m + n - 2;   // total moves
    int k = (m - 1);     // choose down moves (or could choose right moves)
    double res = 1;

    // Compute C(N, k) iteratively to avoid big factorials
    for (int i = 1; i <= k; i++) {
      res = res * (N - k + i) / i;
    }

    return res.round();  // result is guaranteed integer
  }
}

void main() {
  Solution sol = Solution();

  print(sol.uniquePaths(3, 7)); // 28
  print(sol.uniquePaths(3, 2)); // 3
  print(sol.uniquePaths(7, 3)); // 28
  print(sol.uniquePaths(3, 3)); // 6
}
