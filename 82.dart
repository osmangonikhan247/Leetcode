class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode dummy = ListNode(0, head);
    ListNode? prev = dummy;

    while (head != null) {
      bool isDuplicate = false;

      // Check if next node has the same value
      while (head!.next != null && head.val == head.next!.val) {
        isDuplicate = true;
        head = head.next;
      }

      if (isDuplicate) {
        // Skip all nodes with duplicate value
        prev!.next = head.next;
      } else {
        // Move prev only if current value is unique
        prev = prev!.next;
      }
      head = head.next;
    }
    return dummy.next;
  }
}
