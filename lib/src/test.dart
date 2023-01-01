// import './matrix.dart';
// import './dev_utils.dart';
import './square_matrix.dart';

void main(List<String> args) {
  var start = DateTime.now();
  var mat = SquareMatrix.random(40);
  print(mat.determinant());
  var end = DateTime.now();
  print(end.difference(start));

  var matt = SquareMatrix.fromList([
    [1, 2, 3],
    [1, 2, 8],
    [7, 0, -2]
  ]);
  print(matt.inverse());
}
