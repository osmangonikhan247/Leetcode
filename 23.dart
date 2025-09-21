// Definition for singly-linked list.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.isEmpty) return null;

    return _merge(lists, 0, lists.length - 1);
  }

  ListNode? _merge(List<ListNode?> lists, int left, int right) {
    if (left == right) return lists[left];
    int mid = left + (right - left) ~/ 2;
    ListNode? l1 = _merge(lists, left, mid);
    ListNode? l2 = _merge(lists, mid + 1, right);
    return _mergeTwoLists(l1, l2);
  }

  ListNode? _mergeTwoLists(ListNode? l1, ListNode? l2) {
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

    tail.next = (l1 != null) ? l1 : l2;
    return dummy.next;
  }
}
