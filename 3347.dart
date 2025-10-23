class Solution {
  int maxFrequency(List<int> nums, int k, int numOperations) {
    nums.sort();
    int n = nums.length;
    int ans = 1;
    int left = 0;

    for (int right = 0; right < n; right++) {
      // shrink window if we need more than numOperations changes
      while ((right - left) > numOperations || nums[right] - nums[left] > 2 * k) {
        left++;
      }
      ans = ans > (right - left + 1) ? ans : (right - left + 1);
    }
    return ans;
  }
}
