class Solution {
  int mySqrt(int x) {
    if (x < 2) return x; // 0 or 1 are their own square roots

    int left = 1;
    int right = x ~/ 2;
    int ans = 0;

    while (left <= right) {
      int mid = left + ((right - left) ~/ 2);
      int square = mid * mid;

      if (square == x) {
        return mid;
      } else if (square < x) {
        ans = mid;      // mid is a potential answer
        left = mid + 1; // try to find a larger sqrt
      } else {
        right = mid - 1; // mid² > x, move left
      }
    }

    return ans;
  }
}
