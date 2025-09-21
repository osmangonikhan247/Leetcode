class Solution {
  String countAndSay(int n) {
    String result = "1";

    for (int i = 2; i <= n; i++) {
      String current = "";
      int count = 1;

      for (int j = 1; j < result.length; j++) {
        if (result[j] == result[j - 1]) {
          count++;
        } else {
          current += count.toString() + result[j - 1];
          count = 1;
        }
      }
      // append the last group
      current += count.toString() + result[result.length - 1];
      result = current;
    }

    return result;
  }
}
