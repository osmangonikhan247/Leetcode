class Solution {
  int countValidSelections(List<int> nums) {
    int n = nums.length;
    int result = 0;

    for (int start = 0; start < n; start++) {
      if (nums[start] != 0) continue;

      // Try moving left
      if (_canZeroAll(List<int>.from(nums), start, -1)) result++;

      // Try moving right
      if (_canZeroAll(List<int>.from(nums), start, 1)) result++;
    }

    return result;
  }

  bool _canZeroAll(List<int> nums, int curr, int dir) {
    int n = nums.length;

    while (curr >= 0 && curr < n) {
      if (nums[curr] == 0) {
        curr += dir;
      } else {
        nums[curr]--;
        dir = -dir;
        curr += dir;
      }
    }

    // Check if all elements are zero
    for (var x in nums) {
      if (x != 0) return false;
    }
    return true;
  }
}
