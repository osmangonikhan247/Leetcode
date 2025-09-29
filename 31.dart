class Solution {
  void nextPermutation(List<int> nums) {
    int n = nums.length;
    int i = n - 2;

    // Step 1: find first decreasing element
    while (i >= 0 && nums[i] >= nums[i + 1]) {
      i--;
    }

    if (i >= 0) {
      // Step 2: find element just larger than nums[i]
      int j = n - 1;
      while (nums[j] <= nums[i]) {
        j--;
      }
      // Step 3: swap
      _swap(nums, i, j);
    }

    // Step 4: reverse from i+1 to end
    _reverse(nums, i + 1, n - 1);
  }

  void _swap(List<int> nums, int i, int j) {
    int temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;
  }

  void _reverse(List<int> nums, int start, int end) {
    while (start < end) {
      _swap(nums, start, end);
      start++;
      end--;
    }
  }
}

void main() {
  Solution sol = Solution();

  List<int> nums1 = [1, 2, 3];
  sol.nextPermutation(nums1);
  print(nums1); // [1,3,2]

  List<int> nums2 = [3, 2, 1];
  sol.nextPermutation(nums2);
  print(nums2); // [1,2,3]

  List<int> nums3 = [1, 1, 5];
  sol.nextPermutation(nums3);
  print(nums3); // [1,5,1]
}
