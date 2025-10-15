class Solution {
  List<int> plusOne(List<int> digits) {
    int n = digits.length;

    for (int i = n - 1; i >= 0; i--) {
      if (digits[i] < 9) {
        digits[i]++;
        return digits;
      }
      digits[i] = 0; // carry over
    }

    // If all digits were 9 (e.g. [9,9,9] -> [1,0,0,0])
    digits.insert(0, 1);
    return digits;
  }
}

// Example usage
void main() {
  Solution sol = Solution();

  print(sol.plusOne([1, 2, 3])); // [1, 2, 4]
  print(sol.plusOne([4, 3, 2, 1])); // [4, 3, 2, 2]
  print(sol.plusOne([9])); // [1, 0]
  print(sol.plusOne([9, 9, 9])); // [1, 0, 0, 0]
}
