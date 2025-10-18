class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> pathSum(TreeNode? root, int targetSum) {
    List<List<int>> result = [];
    _dfs(root, targetSum, [], result);
    return result;
  }

  void _dfs(TreeNode? node, int remaining, List<int> path, List<List<int>> result) {
    if (node == null) return;

    path.add(node.val);

    // Check if it's a leaf and the sum matches
    if (node.left == null && node.right == null && node.val == remaining) {
      result.add(List.from(path)); // copy the path
    } else {
      _dfs(node.left, remaining - node.val, path, result);
      _dfs(node.right, remaining - node.val, path, result);
    }

    path.removeLast(); // backtrack
  }
}
