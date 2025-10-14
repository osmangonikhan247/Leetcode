class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode? current = head;

    while (current != null && current.next != null) {
      if (current.val == current.next!.val) {
        current.next = current.next!.next; // skip duplicate
      } else {
        current = current.next;
      }
    }

    return head;
  }
}

// Example usage
void main() {
  // Helper to build linked list
  ListNode? buildList(List<int> values) {
    if (values.isEmpty) return null;
    ListNode head = ListNode(values[0]);
    ListNode current = head;
    for (int i = 1; i < values.length; i++) {
      current.next = ListNode(values[i]);
      current = current.next!;
    }
    return head;
  }

  // Helper to print linked list
  void printList(ListNode? head) {
    List<int> result = [];
    while (head != null) {
      result.add(head.val);
      head = head.next;
    }
    print(result);
  }

  Solution sol = Solution();

  ListNode? head1 = buildList([1, 1, 2]);
  printList(sol.deleteDuplicates(head1)); // Output: [1, 2]

  ListNode? head2 = buildList([1, 1, 2, 3, 3]);
  printList(sol.deleteDuplicates(head2)); // Output: [1, 2, 3]
}
