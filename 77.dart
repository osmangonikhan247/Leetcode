class Solution {
  List<List<int>> combine(int n, int k) {
    List<List<int>> result = [];

    void backtrack(int start, List<int> current) {
      // Base case: when current combination size == k
      if (current.length == k) {
        result.add(List.from(current));
        return;
      }

      // Try all possible next numbers
      for (int i = start; i <= n; i++) {
        current.add(i);
        backtrack(i + 1, current); // Move to next number
        current.removeLast();      // Backtrack
      }
    }

    backtrack(1, []);
    return result;
  }
}

void main() {
  Solution sol = Solution();

  print(sol.combine(4, 2)); // [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
  print(sol.combine(1, 1)); // [[1]]
}
