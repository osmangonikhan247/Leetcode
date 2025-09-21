import 'dart:io';

void main() {
  print("Enter numbers separated by space:");
  String? input = stdin.readLineSync();

  // Convert input string -> List<int>
  List<int> nums = input!.split(' ').map(int.parse).toList();

  print("Enter target:");
  int target = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] + nums[j] == target) {
        print([i, j]);
        return;
      }
    }
  }
}
