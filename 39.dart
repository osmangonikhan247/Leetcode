class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    List<List<int>> result = [];

    void backtrack(int start, int remain, List<int> current) {
      if (remain == 0) {
        result.add(List.from(current));
          return;
      }
      if (remain < 0) return;

      for (int i = start; i < candidates.length; i++) {
        current.add(candidates[i]);
        backtrack(i, remain - candidates[i], current); // i (not i+1) since reuse allowed
        current.removeLast();
      }
    }

    backtrack(0, target, []);
    return result;
  }
}
