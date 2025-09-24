class Solution {
  List<List<int>> permuteUnique(List<int> nums) {
    nums.sort(); // Sort to handle duplicates
    List<List<int>> result = [];
    List<int> current = [];
    List<bool> used = List.filled(nums.length, false);

    void backtrack() {
      if (current.length == nums.length) {
        result.add(List.from(current));
        return;
      }

      for (int i = 0; i < nums.length; i++) {
        if (used[i]) continue;
        // Skip duplicates
        if (i > 0 && nums[i] == nums[i - 1] && !used[i - 1]) continue;

        used[i] = true;
        current.add(nums[i]);
        backtrack();
        current.removeLast();
        used[i] = false;
      }
    }

    backtrack();
    return result;
  }
}
