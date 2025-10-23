class Solution {
  // Original algorithmic method (keeps the descriptive name)
  bool isSameAfterOperations(String s) {
    List<int> digits = s.split('').map(int.parse).toList();
    while (digits.length > 2) {
      List<int> next = List<int>.filled(digits.length - 1, 0);
      for (int i = 0; i < digits.length - 1; i++) {
        next[i] = (digits[i] + digits[i + 1]) % 10;
      }
      digits = next;
    }
    return digits[0] == digits[1];
  }

  // Alias to satisfy callers that expect hasSameDigits(...)
  bool hasSameDigits(String s) => isSameAfterOperations(s);
}

void main() {
  // Example tests — adapt or remove when submitting to LeetCode
  var sol = Solution();
  print(sol.hasSameDigits("3902"));  // true
  print(sol.hasSameDigits("34789")); // false
}
