class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool hasPathSum(TreeNode? root, int targetSum) {
    if (root == null) return false;
    // If it's a leaf node, check if the sum matches

    if (root.left == null && root.right == null) {
      return root.val == targetSum;
    }
    // Recur for left and right with reduced target
    int remaining = targetSum - root.val;
    return hasPathSum(root.left, remaining) || hasPathSum(root.right, remaining);
  }
}
