class Solution {
  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) return [];

    Map<String, String> phoneMap = {
      "2": "abc",
      "3": "def",
      "4": "ghi",
      "5": "jkl",
      "6": "mno",
      "7": "pqrs",
      "8": "tuv",
      "9": "wxyz",
    };

    List<String> result = [];

    void backtrack(int index, String current) {
      if (index == digits.length) {
        result.add(current);
        return;
      }

      String letters = phoneMap[digits[index]]!;
      for (int i = 0; i < letters.length; i++) {
        backtrack(index + 1, current + letters[i]);
      }
    }

    backtrack(0, "");
    return result;
  }
}
