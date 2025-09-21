class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    if (head == null || k == 1) return head;

    // Dummy node before head
    ListNode dummy = ListNode(0, head);
    ListNode? groupPrev = dummy;

    while (true) {
      // Find kth node
      ListNode? kth = getKthNode(groupPrev, k);
      if (kth == null) break; // not enough nodes

      ListNode? groupNext = kth.next;

      // Reverse group
      ListNode? prev = groupNext;
      ListNode? curr = groupPrev!.next;

      while (curr != groupNext) {
        ListNode? temp = curr!.next;
        curr.next = prev;
        prev = curr;
        curr = temp;
      }

      // Adjust pointers
      ListNode? temp = groupPrev.next;
      groupPrev.next = kth;
      groupPrev = temp;
    }

    return dummy.next;
  }

  // Helper: move k steps ahead
  ListNode? getKthNode(ListNode? curr, int k) {
    while (curr != null && k > 0) {
      curr = curr.next;
      k--;
    }
    return curr;
  }
}
void main() {
  // Helper: build linked list from List<int>
  ListNode? buildList(List<int> values) {
    ListNode dummy = ListNode(0);
    ListNode curr = dummy;
    for (var v in values) {
      curr.next = ListNode(v);
      curr = curr.next!;
    }
    return dummy.next;
  }

  // Helper: print linked list
  void printList(ListNode? head) {
    List<int> vals = [];
    while (head != null) {
      vals.add(head.val);
      head = head.next;
    }
    print(vals);
  }

  var sol = Solution();

  // Test case 1
  var head1 = buildList([1, 2, 3, 4, 5]);
  var result1 = sol.reverseKGroup(head1, 2);
  printList(result1); // Expected: [2,1,4,3,5]

  // Test case 2
  var head2 = buildList([1, 2, 3, 4, 5]);
  var result2 = sol.reverseKGroup(head2, 3);
  printList(result2); // Expected: [3,2,1,4,5]
}
