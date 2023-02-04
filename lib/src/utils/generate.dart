part of 'utils.dart';

/// 生成全为某个数的List<List<double>>
///
/// Create a matrix instance
List<List<double>> generateLists(double seed, int row, int column) {
  List<List<double>> matrix = [];
  // List<double> list = [];
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
