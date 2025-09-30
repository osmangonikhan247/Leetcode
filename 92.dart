class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? reverseBetween(ListNode? head, int left, int right) {
    if (head == null || left == right) return head;

    // Dummy node simplifies handling when left = 1
    ListNode dummy = ListNode(0, head);
    ListNode? prev = dummy;

    // Step 1: move prev to node just before left
    for (int i = 1; i < left; i++) {
      prev = prev!.next;
    }

    // Now prev points to (left-1)th node
    ListNode? start = prev!.next; // node at position left
    ListNode? then = start!.next; // node at position left+1

    // Step 2: Reverse nodes between left and right
    for (int i = 0; i < right - left; i++) {
      start!.next = then!.next;
      then.next = prev.next;
      prev.next = then;
      then = start.next;
    }

    return dummy.next;
  }
}
