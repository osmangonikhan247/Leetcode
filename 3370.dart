class Solution {
  int smallestNumber(int n) {
    int x = 1;
    while (x < n) {
      x = (x << 1) | 1; // make next all-1 number (1, 3, 7, 15, 31, …)
    }
    return x;
  }
}
void main() {
  var sol = Solution();
  print(sol.smallestNumber(5));  // ✅ 7
  print(sol.smallestNumber(10)); // ✅ 15
  print(sol.smallestNumber(3));  // ✅ 3
}
