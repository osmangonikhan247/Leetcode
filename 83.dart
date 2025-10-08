class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    if (head == null) return null;

    ListNode? current = head;

    // Traverse the linked list
    while (current != null && current.next != null) {
      if (current.val == current.next!.val) {
        // Skip the duplicate node
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }

    return head;
  }
}
