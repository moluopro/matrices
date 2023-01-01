// import './matrix.dart';
// import './dev_utils.dart';
import './square_matrix.dart';

void main(List<String> args) {
  // var start = DateTime.now();
  // var mat = SquareMatrix.random(40);
  // print(mat.determinant());
  // var end = DateTime.now();
  // print(end.difference(start));

  // var matt = SquareMatrix.fromList([
  //   [1, 2, 3],
  //   [1, 2, 8],
  //   [7, 0, -2]
  // ]);
  // print(matt.inverse());

  // Matrix.fromFlattenedList(List<double> list, int row, int column)

  // var mat1 = Matrix.fromFlattenedList([1, 2, 3, 4], 2, 2);
  // var mat2 = Matrix.fromFlattenedList([1, 2, 3, 4], 2, 3);
  // print(mat1);
  // print(mat2);

  // Matrix: 2x2
  // [1.0, 2.0]
  // [3.0, 4.0]

  // Matrix: 2x3
  // [1.0, 2.0, 3.0]
  // [4.0, 0.0, 0.0]

  // SquareMatrix.identity(int row)

  var mat = SquareMatrix.identity(3);
  print(mat);

  // SquareMatrix: 3x3
  // [1.0, 0.0, 0.0]
  // [0.0, 1.0, 0.0]
  // [0.0, 0.0, 1.0]
}
