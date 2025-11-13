class Solution {
  int maxOperations(String s) {
    int ones = 0, ops = 0;

    for (int i = 0; i < s.length - 1; i++) {
      if (s[i] == '1') ones++;
      if (s[i] == '0' && s[i + 1] == '1') ops += ones;
    }

    return ops;
  }
}
