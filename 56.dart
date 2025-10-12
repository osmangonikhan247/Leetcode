class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    if (intervals.isEmpty) return [];

    // Sort intervals by start time
    intervals.sort((a, b) => a[0].compareTo(b[0]));

    List<List<int>> merged = [];
    List<int> current = intervals[0];

    // Iterate and merge overlapping intervals
    for (int i = 1; i < intervals.length; i++) {
      if (intervals[i][0] <= current[1]) {
        // Overlap → merge
        current[1] = current[1] > intervals[i][1] ? current[1] : intervals[i][1];
      } else {
        // No overlap → push current to result and start a new one
        merged.add(List.from(current));
        current = intervals[i];
      }
    }

    // Add the last interval
    merged.add(List.from(current));

    return merged;
  }
}
