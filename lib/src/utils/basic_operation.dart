part of './utils.dart';

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

// 从一个数组生成矩阵
List<List<double>> fromFlattenedList(List<double> list, int row, int column) {
  int index = 0;
  var matrix = generateLists(0, row, column);

  for (int i = 0; i < row; i++) {
    for (int j = 0; j < column; j++) {
      if (index == list.length) {
        return matrix;
      }
      matrix[i][j] = list[index];
      index++;
    }
  }
  return matrix;
}
