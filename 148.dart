class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? sortList(ListNode? head) {
    if (head == null || head.next == null) return head;

    // Step 1: Split the list into two halves using slow & fast pointers
    ListNode? slow = head, fast = head, prev;
    while (fast != null && fast.next != null) {
      prev = slow;
      slow = slow!.next;
      fast = fast.next!.next;
    }
    prev!.next = null; // break the list into two halves

    // Step 2: Sort both halves
    ListNode? left = sortList(head);
    ListNode? right = sortList(slow);

    // Step 3: Merge sorted halves
    return _merge(left, right);
  }

  ListNode? _merge(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0);
    ListNode tail = dummy;

    while (l1 != null && l2 != null) {
      if (l1.val < l2.val) {
        tail.next = l1;
        l1 = l1.next;
      } else {
        tail.next = l2;
        l2 = l2.next;
      }
      tail = tail.next!;
    }

    if (l1 != null) tail.next = l1;
    if (l2 != null) tail.next = l2;

    return dummy.next;
  }
}
