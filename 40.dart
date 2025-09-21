class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    List<List<int>> res = [];
    candidates.sort(); // sort to handle duplicates
    _backtrack(candidates, target, 0, [], res);
    return res;
  }

  void _backtrack(List<int> candidates, int target, int start,
      List<int> path, List<List<int>> res) {
    if (target == 0) {
      res.add(List.from(path));
      return;
    }

    for (int i = start; i < candidates.length; i++) {
      // Skip duplicates
      if (i > start && candidates[i] == candidates[i - 1]) continue;

      if (candidates[i] > target) break; // prune

      path.add(candidates[i]);
      _backtrack(candidates, target - candidates[i], i + 1, path, res);
      path.removeLast(); // backtrack
    }
  }
}
