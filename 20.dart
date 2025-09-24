class Solution {
  bool isValid(String s) {
    List<String> stack = [];
    Map<String, String> mapping = {
      ')': '(',
      ']': '[',
      '}': '{',
    };

    for (var ch in s.split('')) {
      if (mapping.containsKey(ch)) {
        // Closing bracket → check top of stack
        String? top = stack.isEmpty ? '#' : stack.removeLast();
        if (top != mapping[ch]) {
          return false;
        }
      } else {
        // Opening bracket → push to stack
        stack.add(ch);
      }
    }

    return stack.isEmpty;
  }
}
