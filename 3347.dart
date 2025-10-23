class Solution {
  // Method name the test harness expects
  int maxFrequency(List<int> nums, int k, int numOperations) {
    return _maxFrequencyAfterOps(nums, k, numOperations);
  }

  // Implementation (sliding window on sorted array)
  int _maxFrequencyAfterOps(List<int> nums, int k, int numOperations) {
    nums.sort();
    int n = nums.length;
    int left = 0;
    int maxWindow = 1;

    for (int right = 0; right < n; right++) {
      while (left <= right && nums[right] - nums[left] > k) {
        left++;
      }
      int windowSize = right - left + 1;
      if (windowSize > maxWindow) maxWindow = windowSize;
    }

    // We can modify at most `numOperations` distinct indices; one element
    // (the chosen target) doesn't need modification -> max frequency ≤ numOperations + 1
    int result = maxWindow;
    if (result > numOperations + 1) result = numOperations + 1;
    return result;
  }
}

void main() {
  var sol = Solution();
  print(sol.maxFrequency([1, 4, 5], 1, 2));      // 2
  print(sol.maxFrequency([5, 11, 20, 20], 5, 1)); // 2
}
