part of './utils.dart';

/// 求解二维矩阵在某一位置的伴随矩阵
///
/// Return the adjoint matrix
List<List<double>> adjoint(List<List<double>> b, int i, int j) {
  List<List<double>> a = Matrix.zero(b.length - 1, b[0].length - 1).matrix;
  for (int x = 0, y = 0; x < b.length; x++) {
    if (x == i) {
      continue;
    }
    for (int m = 0, n = 0; m < b[0].length; m++) {
      if (m == j) {
        continue;
      }
      a[y][n] = b[x][m];
      n++;
    }
    y++;
  }
  return a;
}
