class Solution {
  int numberOfBeams(List<String> bank) {
    int prevCount = 0;
    int totalBeams = 0;

    for (var row in bank) {
      int currCount = row.split('').where((c) => c == '1').length;

      if (currCount > 0) {
        totalBeams += prevCount * currCount;
        prevCount = currCount;
      }
    }

    return totalBeams;
  }
}
