import 'dart:math';
import 'matrix.dart';

// 生成需要的List<List<double>>
List<List<double>> generateLists(double seed, int row, int column) {
  List<List<double>> matrix = [];
  List<double> list = [];
  for (var i = 0; i < column; i++) {
    list.add(seed);
  }
  for (var i = 0; i < row; i++) {
    matrix.add(List.from(list));
  }
  return matrix;
}

// 生成随机数List<List<double>>
List<List<double>> generateRandomLists(int row, int column) {
  List<List<double>> matrix = [];
  matrix = [];
  List<double> list = [];
  var random = Random();
  for (var i = 0; i < row; i++) {
    for (var i = 0; i < column; i++) {
      list.add(random.nextDouble());
    }
    matrix.add(list);
    list = [];
  }
  return matrix;
}

// 通过数组生成对角阵
List<List<double>> generateDiagonalLists(List<double> diagonal) {
  List<List<double>> matrix = [];
  List<double> list = [];
  for (var i = 0; i < diagonal.length; i++) {
    for (var j = 0; j < diagonal.length; j++) {
      if (i == j) {
        list.add(diagonal[i]);
      } else {
        list.add(0);
      }
    }
    matrix.add(list);
    list = [];
  }
  return matrix;
}

// 将List<List<double>>的行列对换
List<List<double>> listsTranspose(List<List<double>> lists) {
  List<List<double>> temp = [];
  List<double> list = [];
  for (var i = 0; i < lists[0].length; i++) {
    for (var j = 0; j < lists.length; j++) {
      list.add(lists[j][i]);
    }
    temp.add(list);
    list = [];
  }
  return temp;
}

// 求两个List向量的向量积
double crossProduct(List<double> first, List<double> second) {
  double result = 0;
  for (var i = 0; i < first.length; i++) {
    result += (first[i] * second[i]);
  }
  return result;
}

// 复制一个矩阵
List<List<double>> copyMatrix(Matrix copied) {
  List<List<double>> block = [];
  List<double> temp = [];
  for (var i = 0; i < copied.matrix.length; i++) {
    for (var j = 0; j < copied.matrix[0].length; j++) {
      temp.add(copied.matrix[i][j]);
    }
    block.add(temp);
    temp = [];
  }
  return block;
}

// // 获取矩阵的逆 dep_version
// List<List<double>> utilsInverse(List<List<double>> A) {
//         List<List<double>> B = Matrix.zero(A.length, A[0].length).matrix;
//         for (int i = 0; i < A.length; i++) {
//             for (int j = 0; j < A[0].length; j++) {
//                 B[i][j] = A[i][j];
//             }
//         }
//         List<List<double>> C = Matrix.zero(A.length, A[0].length).matrix;
//         for (int i = 0; i < A.length; i++) {
//             for (int j = 0; j < A[0].length; j++) {
//                 C[i][j] = pow(-1, i + j) * utils_determinant(minor(B, j, i));
//             }
//         }
//         List<List<double>> D = Matrix.zero(A.length, A[0].length).matrix;
//         for (int i = 0; i < A.length; i++) {
//             for (int j = 0; j < A[0].length; j++) {
//                 D[i][j] = C[i][j] / utils_determinant(A);
//             }
//         }
//         return D;
//     }

// 获取矩阵的逆
List<List<double>> utilsInverse(List<List<double>> matrix) {
  List<List<double>> L = Matrix.zero(matrix.length, matrix[0].length).matrix;
  List<List<double>> r = Matrix.zero(matrix.length, matrix[0].length).matrix;
  for (int i = 0; i < L.length; i++) {
    L[i][i] = 1;
    for (int j = i + 1; j < L[0].length; j++) {
      L[i][j] = 0;
    }
  }
  List<List<double>> U = Matrix.zero(matrix.length, matrix[0].length).matrix;
  List<List<double>> u = Matrix.zero(matrix.length, matrix[0].length).matrix;
  for (int i = 0; i < U.length; i++) {
    for (int j = 0; j < i; j++) {
      U[i][j] = 0;
    }
  }

  for (int i = 0; i < matrix.length; i++) {
    L[i][0] = matrix[i][0] / matrix[0][0];
  }

  for (int i = 0; i < matrix[0].length; i++) {
    U[0][i] = matrix[0][i];
  }

  int pos = 0;
  while (pos < matrix.length) {
    // 更新U
    for (int col = pos; col < matrix[0].length; col++) {
      double sum_current = 0;
      for (int k = 0; k < pos; k++) {
        sum_current += L[pos][k] * U[k][col];
      }
      U[pos][col] = matrix[pos][col] - sum_current;
    }
    // 更新L
    for (int row = pos + 1; row < matrix.length; row++) {
      double sum_current = 0;
      for (int k = 0; k < pos; k++) {
        sum_current += L[row][k] * U[k][pos];
      }
      L[row][pos] = (matrix[row][pos] - sum_current) / U[pos][pos];
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

// 求解矩阵的行列式
double utilsDeterminant(List<List<double>> a) {
  if (a.length == 1) {
    return a[0][0];
  }
  double det = 0;
  for (int i = 0; i < a[0].length; i++) {
    det += pow(-1, i) * a[0][i] * utilsDeterminant(minor(a, 0, i));
  }
  return det;
}

// 求解二维矩阵在某一位置的伴随矩阵
List<List<double>> minor(List<List<double>> b, int i, int j) {
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
