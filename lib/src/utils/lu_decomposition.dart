part of './utils.dart';

List<List<List<double>>> luDecomposition(List<List<double>> matrix) {
  List<List<double>> L = generateLists(0, matrix.length, matrix.length);

  for (int i = 0; i < L.length; i++) {
    L[i][i] = 1;
  }

  List<List<double>> U = generateLists(0, matrix.length, matrix.length);

  for (int i = 0; i < matrix.length; i++) {
    L[i][0] = matrix[i][0] / matrix[0][0];
    U[0][i] = matrix[0][i];

    // 判断是否继续使用LU
    if (L[i][0].isInfinite || L[i][0].isNaN) {
      return [];
    }
  }

  int pos = 0;
  while (pos < matrix.length) {
    // 更新U
    for (int col = pos; col < matrix[0].length; col++) {
      double sumCurrent = 0;
      for (int k = 0; k < pos; k++) {
        sumCurrent += L[pos][k] * U[k][col];
      }
      U[pos][col] = matrix[pos][col] - sumCurrent;
    }
    // 更新L
    for (int row = pos + 1; row < matrix.length; row++) {
      double sumCurrent = 0;
      for (int k = 0; k < pos; k++) {
        sumCurrent += L[row][k] * U[k][pos];
      }
      L[row][pos] = (matrix[row][pos] - sumCurrent) / U[pos][pos];

      // 判断是否继续使用LU
      if (L[row][pos].isInfinite || L[row][pos].isNaN) {
        return [];
      }
    }
    pos++;
  }
  return [L, U];
}
