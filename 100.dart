class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    // Case 1: both null
    if (p == null && q == null) return true;

    // Case 2: one null but not the other
    if (p == null || q == null) return false;

    // Case 3: both not null -> compare values + recurse
    return (p.val == q.val) &&
        isSameTree(p.left, q.left) &&
        isSameTree(p.right, q.right);
  }
}
