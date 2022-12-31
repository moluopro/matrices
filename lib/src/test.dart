import './matrix.dart';
import './dev_utils.dart';
import './square_matrix.dart';

void main(List<String> args) {
  var start = DateTime.now();
  var mat = SquareMatrix.random(40);
  print(mat.determinant());
  var end = DateTime.now();
  print(end.difference(start));
}
