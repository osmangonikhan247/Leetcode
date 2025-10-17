class Solution {
  List<List<int>> subsetsWithDup(List<int> nums) {
    nums.sort();
    List<List<int>> result = [];
    List<int> current = [];

    void backtrack(int start) {
      result.add(List.from(current));

      for (int i = start; i < nums.length; i++) {
        if (i > start && nums[i] == nums[i - 1]) continue;
        current.add(nums[i]);
        backtrack(i + 1);
        current.removeLast();
      }
    }

    backtrack(0);
    return result;
  }
}
