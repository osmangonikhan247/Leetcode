class Solution {
  int removeDuplicates(List<int> nums) {
    int n = nums.length;
    if (n <= 2) return n; // If 2 or fewer elements, all allowed

    int index = 2; // Start from 3rd position

    for (int i = 2; i < n; i++) {
      // Compare with element two steps behind
      if (nums[i] != nums[index - 2]) {
        nums[index] = nums[i];
        index++;
      }
    }

    return index; // 'index' is the new length
  }
}
