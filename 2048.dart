class Solution {
  int nextBeautifulNumber(int n) {
    int num = n + 1;
    while (true) {
      if (_isBalanced(num)) return num;
      num++;
    }
  }

  bool _isBalanced(int x) {
    List<int> freq = List.filled(10, 0);
    String s = x.toString();
    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 48]++;
    }

    // digit 0 must not appear
    if (freq[0] != 0) return false;

    // for digits 1..9: if present, must appear exactly d times
    for (int d = 1; d <= 9; d++) {
      if (freq[d] != 0 && freq[d] != d) return false;
    }
    return true;
  }
}
