part of './utils.dart';

/// 求解矩阵的行列式(伴随阵)
///
/// Return the determinant of a squarematrix(deprecated)
double determinant(List<List<double>> a) {
  if (a.length == 1) {
    return a[0][0];
  }
  double det = 0;
  for (int i = 0; i < a[0].length; i++) {
    det += pow(-1, i) * a[0][i] * determinant(adjoint(a, 0, i));
  }
  return det;
}

/// 求解矩阵的行列式(LU分解)，失败则使用基础方法求解
///
/// Return the determinant of a squarematrix(recommend)
double determinantLu(List<List<double>> matrix) {
  for (int i = 0; i < matrix.length; i++) {
    if (matrix[i][i] == 0) {
      return determinant(matrix);
    }
  }

  // LU分解获取L矩阵和U矩阵
  // 若返回空数组，则认定为无法进行LU分解
  var luResult = luDecomposition(matrix);
  if (luResult.isEmpty) {
    return determinant(matrix);
  }

  List<List<double>> L = luResult[0];
  List<List<double>> U = luResult[1];

  double result = 1;
  for (int i = 0; i < matrix.length; i++) {
    result *= L[i][i];
    result *= U[i][i];
  }

  if (result.isNaN) {
    return determinant(matrix);
  }
  return result;
}
