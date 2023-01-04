// import 'package:matrices/matrices.dart';

/// 在Matrices中，向量即List<double>类型的数据
/// vector.dart提供了一些常用的操作向量类型的方法

void main(List<String> args) {
  print(double is num);
  print(int is num);
  print(num is double);
  num a = 1;
  num b = 1.0;
  print(a-b);

  // var a = [1, 2.0, 3.9];
  // var b = Matrix.fromList([
  //   [1, 2.0, 3.9],
  //   [2, 3, 4],
  // ]);
  // print(a);
  // print(b);
}

/// 快速生成0到n的向量
// List<double> o_n(int n) {
//   List<double> result = [];
//   for (; n >= 0; n--) {
//     result.insert(n, result.length.toDouble());
//   }
//   return result;
// }

/// 快速生成1到n的向量
// List<double> l_n(int n) {
//   List<double> result = [];
//   for (; n > 0; n--) {
//     result.insert(n, result.length.toDouble());
//   }
//   return result;
// }

/// 快速生成m到n的向量
// List<double> m_n(int m, int n) {
//   List<double> result = [];
//   for (; n >= m; n--) {
//     result.insert(n, result.length.toDouble());
//   }
//   return result;
// }

/// 快速生成从m开始的n个元素的数组，步长为l
// List<double> l_m_n(int m, int n) {
//   List<double> result = [];
//   for (; n > 0; n--) {
//     result.insert(n, result.length.toDouble());
//   }
//   return result;
// }