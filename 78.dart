class Solution {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> result = [[]];

    for (int num in nums) {
      int size = result.length;
      for (int i = 0; i < size; i++) {
        result.add([...result[i], num]);
      }
    }
    return result;
  }
}
