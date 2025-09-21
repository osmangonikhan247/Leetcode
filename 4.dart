class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    // make nums1 the smaller array
    if (nums1.length > nums2.length) {
      var tmp = nums1;
      nums1 = nums2;
      nums2 = tmp;
    }

    int m = nums1.length;
    int n = nums2.length;
    int low = 0, high = m;

    while (low <= high) {
      int i = (low + high) ~/ 2;
      int j = (m + n + 1) ~/ 2 - i;

      double maxLeft1 = (i == 0) ? double.negativeInfinity : nums1[i - 1].toDouble();
      double minRight1 = (i == m) ? double.infinity : nums1[i].toDouble();

      double maxLeft2 = (j == 0) ? double.negativeInfinity : nums2[j - 1].toDouble();
      double minRight2 = (j == n) ? double.infinity : nums2[j].toDouble();

      if (maxLeft1 <= minRight2 && maxLeft2 <= minRight1) {
        // correct partition found
        if (((m + n) & 1) == 1) {
          // odd total length
          return maxLeft1 > maxLeft2 ? maxLeft1 : maxLeft2;
        } else {
          // even total length
          double leftMax = maxLeft1 > maxLeft2 ? maxLeft1 : maxLeft2;
          double rightMin = minRight1 < minRight2 ? minRight1 : minRight2;
          return (leftMax + rightMin) / 2.0;
        }
      } else if (maxLeft1 > minRight2) {
        high = i - 1;
      } else {
        low = i + 1;
      }
    }

    return 0.0; // Shouldn't reach here for valid input
  }
}

void main() {
  var sol = Solution();

  print(sol.findMedianSortedArrays([1, 3], [2]));
  print(sol.findMedianSortedArrays([1, 2], [3, 4]));
  print(sol.findMedianSortedArrays([0, 0], [0, 0]));
  print(sol.findMedianSortedArrays([], [1]));
  print(sol.findMedianSortedArrays([2], []));
}
