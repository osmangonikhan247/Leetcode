class Solution {
  String minRemoveToMakeValid(String s) {
    List<String> chars = s.split('');
    List<int> stack = [];

    // Pass 1: mark invalid ')'
    for (int i = 0; i < chars.length; i++) {
      if (chars[i] == '(') {
        stack.add(i);
      } else if (chars[i] == ')') {
        if (stack.isNotEmpty) {
          stack.removeLast();
        } else {
          chars[i] = ''; // mark invalid ')'
        }
      }
    }

    // Pass 2: mark unmatched '('
    for (int index in stack) {
      chars[index] = '';
    }

    return chars.join();
  }
}
