import 'dart:math';
import '../matrix.dart';

part './generate.dart';
part './basic_operation.dart';
part './adjoint.dart';
part './determinant.dart';
part './lu_decomposition.dart';
part './inverse.dart';

// List<List<double>> reg(List<List<double>> matrix) {
//   for (var i = 0; i < matrix[0].length; i++) {
//     ///
//     /// 遍历矩阵的(i, i)元素，若为0，.....
//     ///
//     if (matrix[i][i] == 0) {
//       ///
//       /// 从第一行遍历
//       ///
//       for (var j = 0; j < matrix[0].length; j++) {
//         ///
//         /// 若遍历到i行，跳过；
//         /// 遍历到(j, i)不为0的元素时，将此行(j)行加到i行，使(i, i)元素不为0；
//         /// 完成遍历后，若i列元素都为零，表示行列式为0，返回[[0]];
//         ///
//         if (j == i || (matrix[j][i] == 0 && j < matrix[0].length)) {
//           continue;
//         } else if (matrix[j][i] != 0) {
//           ///
//           /// matrix的第i行元素
//           ///
//           List<double> vector = [];
//           for (int k = 0; k < matrix[i].length; k++) {
//             vector.add(matrix[j][k] + matrix[i][k]);
//           }
//           matrix[i] = vector;
//           // print(vect);

//           ///
//           /// 遍历到第一个(j, i)不为0的元素时，提取此行，构造rowsNum * columnsNum的
//           /// 矩阵，将该行放在第i行，其余行元素都为0
//           ///

//           //
//           // Matrix matTemp = Matrix.fromList(List.generate(
//           //     matrix.matrix[0].length,
//           //     (index) => index == i
//           //         ? vect.toList()
//           //         : List.filled(matrix.rowsNum, 0.0)));

//           ///
//           /// 原矩阵`matrix`加·`matTemp`使matrix[i][i]不为0；
//           /// 退出循环
//           ///
//           // print("matrix $matrix");
//           // print("matTemp $matTemp");
//           //
//           // matrix += matTemp;
//           // matrix = changeRow(matrix, i, vect);
//           break;
//         } else {
//           return [
//             [0]
//           ];
//         }
//       }
//     }
//   }
//   return matrix;
// }
