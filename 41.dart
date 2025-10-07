import 'dart:math';

class Solution {
  int firstMissingPositive(List<int> nums) {
    int n = nums.length;

    // Replace all non-positive and too-large numbers with n+1
    for (int i = 0; i < n; i++) {
      if (nums[i] <= 0 || nums[i] > n) {
        nums[i] = n + 1;
      }
    }

    //Mark presence of numbers 1..n by negating their corresponding indices
    for (int i = 0; i < n; i++) {
      int num = nums[i].abs();
      if (num <= n) {
        nums[num - 1] = -nums[num - 1].abs(); // mark index num-1 as visited
      }
    }

    // The first index with positive number means missing number = index + 1
    for (int i = 0; i < n; i++) {
      if (nums[i] > 0) return i + 1;
    }

    //If all are present, return n+1
    return n + 1;
  }
}
