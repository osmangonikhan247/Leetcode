class Solution {
  void sortColors(List<int> nums) {
    int low = 0;
    int mid = 0;
    int high = nums.length - 1;

    while (mid <= high) {
      if (nums[mid] == 0) {
        int temp = nums[low];
        nums[low] = nums[mid];
        nums[mid] = temp;
        low++;
        mid++;
      } else if (nums[mid] == 1) {
        mid++;
      } else { // nums[mid] == 2
        int temp = nums[mid];
        nums[mid] = nums[high];
        nums[high] = temp;
        high--;
      }
    }
  }
}

void main() {
  Solution sol = Solution();

  List<int> nums1 = [2, 0, 2, 1, 1, 0];
  sol.sortColors(nums1);
  print(nums1); // [0,0,1,1,2,2]

  List<int> nums2 = [2, 0, 1];
  sol.sortColors(nums2);
  print(nums2); // [0,1,2]
}
