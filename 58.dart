class Solution {
  int lengthOfLastWord(String s) {
    int i = s.length - 1;

    // skip trailing spaces
    while (i >= 0 && s[i] == ' ') {
      i--;
    }

    int length = 0;
    // count characters of the last word
    while (i >= 0 && s[i] != ' ') {
      length++;
      i--;
    }

    return length;
  }
}
