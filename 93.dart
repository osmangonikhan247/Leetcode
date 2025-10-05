class Solution {
  List<String> restoreIpAddresses(String s) {
    List<String> result = [];

    void backtrack(int start, List<String> path) {
      // If we already have 4 segments and used all characters
      if (path.length == 4 && start == s.length) {
        result.add(path.join('.'));
        return;
      }

      // If more than 4 segments or too many chars left, stop
      if (path.length >= 4) return;

      // Try all possible segment lengths (1 to 3 digits)
      for (int len = 1; len <= 3; len++) {
        if (start + len > s.length) break;

        String segment = s.substring(start, start + len);

        // Rule: No leading zeros unless "0"
        if (segment.length > 1 && segment[0] == '0') continue;

        // Rule: Must be <= 255
        int value = int.parse(segment);
        if (value > 255) continue;

        // Choose this segment and recurse
        path.add(segment);
        backtrack(start + len, path);
        path.removeLast(); // backtrack
      }
    }

    backtrack(0, []);
    return result;
  }
}
