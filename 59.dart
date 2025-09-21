class Solution {
  List<List<int>> generateMatrix(int n) {
    List<List<int>> matrix = List.generate(n, (_) => List.filled(n, 0));

    int left = 0, right = n - 1, top = 0, bottom = n - 1;
    int num = 1, maxNum = n * n;

    while (num <= maxNum) {
      // left → right
      for (int j = left; j <= right && num <= maxNum; j++) {
        matrix[top][j] = num++;
      }
      top++;

      // top → bottom
      for (int i = top; i <= bottom && num <= maxNum; i++) {
        matrix[i][right] = num++;
      }
      right--;

      // right → left
      for (int j = right; j >= left && num <= maxNum; j--) {
        matrix[bottom][j] = num++;
      }
      bottom--;

      // bottom → top
      for (int i = bottom; i >= top && num <= maxNum; i--) {
        matrix[i][left] = num++;
      }
      left++;
    }

    return matrix;
  }
}
