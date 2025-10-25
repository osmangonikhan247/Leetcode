class Solution {
  int totalMoney(int n) {
    int weeks = n ~/ 7;
    int days = n % 7;

    // Total from complete weeks
    int total = weeks * 28 + (weeks * (weeks - 1) * 7) ~/ 2;

    // Add remaining days
    int start = weeks + 1;
    for (int i = 0; i < days; i++) {
      total += start + i;
    }
    return total;
  }
}
