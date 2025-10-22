class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<TreeNode?> generateTrees(int n) {
    if (n == 0) return [];

    return _generate(1, n);
  }

  List<TreeNode?> _generate(int start, int end) {
    List<TreeNode?> result = [];

    if (start > end) {
      result.add(null);
      return result;
    }

    for (int i = start; i <= end; i++) {
      List<TreeNode?> leftTrees = _generate(start, i - 1);
      List<TreeNode?> rightTrees = _generate(i + 1, end);

      for (var left in leftTrees) {
        for (var right in rightTrees) {
          TreeNode root = TreeNode(i);
          root.left = left;
          root.right = right;
          result.add(root);
        }
      }
    }

    return result;
  }
}
