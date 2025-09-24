class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    ListNode dummy = ListNode(0, head);
    ListNode? fast = dummy;
    ListNode? slow = dummy;

    // Move fast n+1 steps ahead to maintain gap
    for (int i = 0; i <= n; i++) {
      fast = fast?.next;
    }

    // Move both until fast reaches end
    while (fast != null) {
      fast = fast.next;
      slow = slow?.next;
    }

    // Delete nth node
    slow?.next = slow?.next?.next;

    return dummy.next;
  }
}
