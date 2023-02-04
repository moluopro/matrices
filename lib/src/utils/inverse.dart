part of './utils.dart';

// 伴随阵求矩阵的逆(Deprecated)
List<List<double>> inverse(List<List<double>> A) {
  List<List<double>> B = Matrix.zero(A.length, A[0].length).matrix;
  for (int i = 0; i < A.length; i++) {
    for (int j = 0; j < A[0].length; j++) {
      B[i][j] = A[i][j];
    }
  }
  List<List<double>> C = Matrix.zero(A.length, A[0].length).matrix;
  for (int i = 0; i < A.length; i++) {
    for (int j = 0; j < A[0].length; j++) {
      C[i][j] = pow(-1, i + j) * determinant(adjoint(B, j, i));
    }
  }
  List<List<double>> D = Matrix.zero(A.length, A[0].length).matrix;
  for (int i = 0; i < A.length; i++) {
    for (int j = 0; j < A[0].length; j++) {
      D[i][j] = C[i][j] / determinant(A);
    }
  }
  return D;
}

/// LU分解求矩阵的逆，失败则使用基础方法求解
///
/// Return the inverse of a squarematrix through LU decomposition
List<List<double>> inverseLu(List<List<double>> matrix) {
  // LU分解获取L矩阵和U矩阵
  // 若返回空数组，则认定为无法进行LU分解
  var luResult = luDecomposition(matrix);
  if (luResult.isEmpty) {
    return inverse(matrix);
  }
  List<List<double>> L = luResult[0];
  List<List<double>> U = luResult[1];

  // 计算L和U的逆矩阵
  List<List<double>> r = generateLists(0, matrix.length, matrix.length);
  List<List<double>> u = generateLists(0, matrix.length, matrix.length);
  // 计算L的逆矩阵
  for (int j = 0; j < matrix.length; j++) {
    for (int i = j; i < matrix.length; i++) {
      if (i == j) {
        r[i][j] = 1 / L[i][j];

        // 判断是否继续使用LU
        if (r[i][j].isInfinite || r[i][j].isNaN) {
          return inverse(matrix);
        }
      } else if (i < j) {
        r[i][j] = 0;
      } else {
        double s = 0.0;
        for (int k = j; k < i; k++) {
          s += L[i][k] * r[k][j];
        }
        r[i][j] = -r[j][j] * s;
      }
    }
  }

  // 计算U的逆矩阵
  for (int j = 0; j < matrix.length; j++) {
    for (int i = j; i >= 0; i--) {
      if (i == j) {
        u[i][j] = 1 / U[i][j];

        // 判断是否继续使用LU
        if (u[i][j].isInfinite || u[i][j].isNaN) {
          return inverse(matrix);
        }
      } else if (i > j) {
        u[i][j] = 0;
      } else {
        double s = 0.0;
        for (int k = i + 1; k <= j; k++) {
          s += U[i][k] * u[k][j];
        }
        u[i][j] = -1 / U[i][i] * s;

        // 判断是否继续使用LU
        if (u[i][j].isInfinite || u[i][j].isNaN) {
          return inverse(matrix);
        }
      }
    }
  }

  List<List<double>> inv = generateLists(0, matrix.length, matrix.length);
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix.length; j++) {
      for (int k = 0; k < matrix.length; k++) {
        inv[i][j] += u[i][k] * r[k][j];
      }
    }
  }
  return inv;
}
