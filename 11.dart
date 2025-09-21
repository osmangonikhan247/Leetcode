class Solution {
  int maxArea(List<int> height) {
    int l = 0;
    int r = height.length - 1;
    int maxWater = 0;

    while (l < r) {
      int h = height[l] < height[r] ? height[l] : height[r];
      int width = r - l;
      int area = h * width;
      if (area > maxWater) {
        maxWater = area;
      }

      if (height[l] < height[r]) {
        l++;
      } else {
        r--;
      }
    }

    return maxWater;
  }
}
