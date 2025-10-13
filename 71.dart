class Solution {
  String simplifyPath(String path) {
    List<String> stack = [];
    List<String> parts = path.split('/');

    for (String part in parts) {
      if (part.isEmpty || part == '.') {
        continue;
      } else if (part == '..') {
        if (stack.isNotEmpty) {
          stack.removeLast();
        }
      } else {
        stack.add(part);
      }
    }

    return '/' + stack.join('/');
  }
}

void main() {
  Solution sol = Solution();
  print(sol.simplifyPath("/home/")); // Output: /home
  print(sol.simplifyPath("/home//foo/")); // Output: /home/foo
  print(sol.simplifyPath("/home/user/Documents/../Pictures")); // Output: /home/user/Pictures
  print(sol.simplifyPath("/../")); // Output: /
  print(sol.simplifyPath("/.../a/../b/c/../d/./")); // Output: /.../b/d
}
