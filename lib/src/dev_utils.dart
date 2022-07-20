import 'dart:math';
import 'matrix.dart';

/// 生成需要的List<List<double>>
///
/// Create a matrix instance
List<List<double>> generateLists(double seed, int row, int column) {
  List<List<double>> matrix = [];
  List<double> list = [];
  // for (var i = 0; i < column; i++) {
  //   list.add(seed);
  // }
  // for (var i = 0; i < row; i++) {
  //   matrix.add(List.from(list));
  // }
  matrix = List.generate(
      row, (indexRow) => List.generate(column, (indexColumn) => seed));
  return matrix;
}

/// 生成随机数List<List<double>>
///
/// Create a matrix instance with random elements
List<List<double>> generateRandomLists(int row, int column) {
  List<List<double>> matrix = [];
  matrix = [];
  var random = Random();

  // List<double> list = [];
  // for (var i = 0; i < row; i++) {
  //   for (var i = 0; i < column; i++) {
  //     list.add(random.nextDouble());
  //   }
  //   matrix.add(list);
  //   list = [];
  // }
  matrix = List.generate(
      row,
      (indexRow) =>
          List.generate(column, (indexColumn) => random.nextDouble()));
  return matrix;
}

/// 通过数组生成对角阵
///
/// Create a diagonal matrix from an array
///
/// Similar to `diag` function in MATLAB
List<List<double>> generateDiagonalLists(List<double> diagonal) {
  List<List<double>> matrix = [];
  // List<double> list = [];
  // for (var i = 0; i < diagonal.length; i++) {
  //   for (var j = 0; j < diagonal.length; j++) {
  //     if (i == j) {
  //       list.add(diagonal[i]);
  //     } else {
  //       list.add(0);
  //     }
  //   }
  //   matrix.add(list);
  //   list = [];
  // }
  int length = diagonal.length;
  matrix = List.generate(
      length,
      (indexRow) => List.generate(length,
          (indexColumn) => indexRow == indexColumn ? diagonal[indexRow] : 0.0));
  return matrix;
}

/// 将List<List<double>>的行列对换
///
/// Conpute the transpose of a matrix
List<List<double>> listsTranspose(List<List<double>> lists) {
  List<List<double>> temp = [];
  // List<double> list = [];
  // for (var i = 0; i < lists[0].length; i++) {
  //   for (var j = 0; j < lists.length; j++) {
  //     list.add(lists[j][i]);
  //   }
  //   temp.add(list);
  //   list = [];
  // }
  int rows = lists.length;
  int columns = lists[0].length;
  temp = List.generate(
      columns,
      (indexRow) =>
          List.generate(rows, (indexColumn) => lists[indexColumn][indexRow]));
  return temp;
}

/// 求两个List向量的点积
///
/// Return the dot product of two vectors which have the same length
double dotProduct(List<double> firstVector, List<double> secondVector) {
  double result = 0;
  for (var i = 0; i < firstVector.length; i++) {
    result += (firstVector[i] * secondVector[i]);
  }
  return result;
}

/// 复制一个矩阵
///
/// Copy from the matrix `copied` (deep copy)
List<List<double>> copyMatrix(Matrix copied) {
  List<List<double>> block = [];
  // List<double> temp = [];
  // for (var i = 0; i < copied.matrix.length; i++) {
  //   for (var j = 0; j < copied.matrix[0].length; j++) {
  //     temp.add(copied.matrix[i][j]);
  //   }
  //   block.add(temp);
  //   temp = [];
  // }
  block = List.generate(
      copied.matrix.length,
      (indexRow) => List.generate(copied.matrix[0].length,
          (indexColumn) => copied.matrix[indexRow][indexColumn]));
  return block;
}

/// 获取矩阵的逆
///
/// Return the inverse of a squarematrix through LU decomposition
List<List<double>> utilsInverse(List<List<double>> matrix) {
  List<List<double>> L = Matrix.zero(matrix.length, matrix.length).matrix;
  List<List<double>> r = Matrix.zero(matrix.length, matrix.length).matrix;

  for (int i = 0; i < L.length; i++) {
    L[i][i] = 1;
  }

  List<List<double>> U = Matrix.zero(matrix.length, matrix.length).matrix;
  List<List<double>> u = Matrix.zero(matrix.length, matrix.length).matrix;

  for (int i = 0; i < matrix.length; i++) {
    L[i][0] = matrix[i][0] / matrix[0][0];
    U[0][i] = matrix[0][i];
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
    }
    pos++;
  }

  // 计算 L_inv
  for (int j = 0; j < matrix.length; j++) {
    for (int i = j; i < matrix.length; i++) {
      if (i == j)
        r[i][j] = 1 / L[i][j];
      else if (i < j)
        r[i][j] = 0;
      else {
        double s = 0.0;
        for (int k = j; k < i; k++) {
          s += L[i][k] * r[k][j];
        }
        r[i][j] = -r[j][j] * s;
      }
    }
  }

  // 计算 U_inv
  for (int j = 0; j < matrix.length; j++) {
    for (int i = j; i >= 0; i--) {
      if (i == j)
        u[i][j] = 1 / U[i][j];
      else if (i > j)
        u[i][j] = 0;
      else {
        double s = 0.0;
        for (int k = i + 1; k <= j; k++) {
          s += U[i][k] * u[k][j];
        }
        u[i][j] = -1 / U[i][i] * s;
      }
    }
  }

  List<List<double>> inv = Matrix.zero(matrix.length, matrix[0].length).matrix;
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix.length; j++) {
      for (int k = 0; k < matrix.length; k++) {
        inv[i][j] += u[i][k] * r[k][j];
      }
    }
  }
  return inv;
}

/// 求解矩阵的行列式
///
/// Return the determinant of a squarematrix
double utilsDeterminant(List<List<double>> a) {
  if (a.length == 1) {
    return a[0][0];
  }
  double det = 0;
  for (int i = 0; i < a[0].length; i++) {
    det += pow(-1, i) * a[0][i] * utilsDeterminant(adjoint(a, 0, i));
  }
  return det;
}

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
