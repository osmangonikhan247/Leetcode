class Solution {
  int longestValidParentheses(String s) {
    List<int> stack = [-1]; // stores indices, start with base
    int maxLen = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        // Push index of '('
        stack.add(i);
      } else {
        // Pop the last index
        stack.removeLast();

        if (stack.isEmpty) {
          // if stack empty, push current index as new base
          stack.add(i);
        } else {
          // Calculate valid length
          maxLen = maxLen > (i - stack.last) ? maxLen : (i - stack.last);
        }
      }
    }

    return maxLen;
  }
}
