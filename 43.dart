class Solution {
  String multiply(String num1, String num2) {
    if (num1 == "0" || num2 == "0") return "0";

    int m = num1.length, n = num2.length;
    List<int> result = List.filled(m + n, 0);

    // Multiply each digit from right to left
    for (int i = m - 1; i >= 0; i--) {
      for (int j = n - 1; j >= 0; j--) {
        int mul = (num1.codeUnitAt(i) - '0'.codeUnitAt(0)) *
            (num2.codeUnitAt(j) - '0'.codeUnitAt(0));
        int sum = mul + result[i + j + 1];

        result[i + j + 1] = sum % 10;
        result[i + j] += sum ~/ 10;
      }
    }

    // Convert result to string
    String res = result.join();
    int start = 0;
    while (start < res.length && res[start] == '0') start++;
    return start == res.length ? "0" : res.substring(start);
  }
}
