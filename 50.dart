class Solution {
  double myPow(double x, int n) {
    if (n == 0) return 1.0;

    // Convert n to long because -2^31 overflows when taking abs
    int exp = n;
    double base = x;

    if (exp < 0) {
      base = 1 / base;
      // careful: -2^31 is out of range if negated, so use -(exp + 1)
      exp = -(exp + 1);
      return base * _fastPow(base, exp);
    }

    return _fastPow(base, exp);
  }

  double _fastPow(double x, int n) {
    if (n == 0) return 1.0;
    double half = _fastPow(x, n ~/ 2);
    if (n % 2 == 0) {
      return half * half;
    } else {
      return half * half * x;
    }
  }
}

void main() {
  Solution sol = Solution();

  print(sol.myPow(2.0, 10));   // 1024.0
  print(sol.myPow(2.1, 3));    // 9.261
  print(sol.myPow(2.0, -2));   // 0.25
}
