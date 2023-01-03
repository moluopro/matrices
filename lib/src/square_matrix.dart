import 'matrix.dart';
import './utils/utils.dart';

/// 方阵类，继承自矩阵类
class SquareMatrix extends Matrix {
  /// 构造方法，通过List<List<double>>生成SquareMatrix
  SquareMatrix() {} // 默认不使用，仅作为脚手架
  SquareMatrix.fromList(List<List<double>> lists) {
    bool isSquareMatrix = true;
    for (var list in lists) {
      if (lists.length == list.length) {
      } else {
        isSquareMatrix = false;
      }
    }
    if (isSquareMatrix) {
      matrix = lists;
    } else {
      print('Square matrix can\'t be created. ');
    }
  }

  /// 命名构造方法，生成单位矩阵
  SquareMatrix.identity(int row) {
    matrix = generateDiagonalLists(generateLists(1, 1, row)[0]);
  }

  /// 命名构造方法，生成全0全1和全为某数字的方阵
  SquareMatrix.zero(int row) {
    matrix = generateLists(0, row, row);
  }
  SquareMatrix.one(int row) {
    matrix = generateLists(1, row, row);
  }
  SquareMatrix.number(double number, int row) {
    matrix = generateLists(number, row, row);
  }

  /// 命名构造方法，生成全为随机数的方阵
  SquareMatrix.random(int row) {
    matrix = generateRandomLists(row, row);
  }

  /// 命名构造方法，生成主对角线元素的值为某数组的对角阵
  SquareMatrix.diagonal(List<double> list) {
    matrix = generateDiagonalLists(list);
  }

  /// 命名构造方法，生成主对角线元素的值为某数字的对角阵
  SquareMatrix.diagonalFromNumber(double num, int row) {
    List<double> list = [];
    for (var i = 0; i < row; i++) {
      list.add(num);
    }
    matrix = generateDiagonalLists(list);
  }

  @override
  String toString() {
    return ('Square' + super.toString());
  }

  /// 获取方阵的行列式的值
  double get determinant {
    return determinantLu(this.matrix);
  }

  /// 获取方阵的逆矩阵
  SquareMatrix get inverse {
    return SquareMatrix.fromList(inverseLu(this.matrix));
  }

  /// 获取方阵的特征值
  @Deprecated('message')
  double get eigenvalue {
    return 0.0;
  }

  /// 获取方阵的特征向量
  List<double> get eigenvector {
    return matrix[0];
  }
}
