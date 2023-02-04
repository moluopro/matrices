import 'dart:math';

/// 在Matrices中，向量即List<double>类型的数据
/// vector.dart提供了一些常用的操作向量类型的方法

typedef Vector = List<double>;

/// 创建向量
///
/// Create a vector instance
Vector vector(List<double> vector) {
  return vector;
}

/// 生成全为某个数的向量
///
/// Create a vector instance by a number
Vector numberVector(int length, double seed) {
  return Vector.generate(length, (index) => seed);
}

/// 生成随机数向量
///
/// Create a vector instance with random elements
Vector randomVector(int length) {
  var random = Random();
  return Vector.generate(length, (index) => random.nextDouble());
}

/// 生成从start到end的步长为step的向量，默认步长为1
///
/// Create a vector instance with step
Vector rangeVector(num start, num end, {num step = 1}) {
  Vector result = [];
  while (start <= end) {
    result.add(start.toDouble());
    start += step;
  }
  return result;
}
