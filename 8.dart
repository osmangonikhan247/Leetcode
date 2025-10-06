class Solution {
  int myAtoi(String s) {
    int i = 0;
    int n = s.length;
    int sign = 1;
    int result = 0;
    const int INT_MAX = 2147483647;
    const int INT_MIN = -2147483648;

    //Skip leading whitespaces
    while (i < n && s[i] == ' ') {
      i++;
    }

    // Check for sign
    if (i < n && (s[i] == '+' || s[i] == '-')) {
      sign = (s[i] == '-') ? -1 : 1;
      i++;
    }

    // Convert digits to integer
    while (i < n && s[i].codeUnitAt(0) >= '0'.codeUnitAt(0) && s[i].codeUnitAt(0) <= '9'.codeUnitAt(0)) {
      int digit = s[i].codeUnitAt(0) - '0'.codeUnitAt(0);

      // Handle overflow/underflow before it happens
      if (result > (INT_MAX - digit) ~/ 10) {
        return (sign == 1) ? INT_MAX : INT_MIN;
      }

      result = result * 10 + digit;
      i++;
    }

    // Apply sign
    result *= sign;

    //Clamp within 32-bit signed integer range
    if (result < INT_MIN) return INT_MIN;
    if (result > INT_MAX) return INT_MAX;

    return result;
  }
}
