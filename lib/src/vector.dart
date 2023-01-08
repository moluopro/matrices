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
  return Vector.generate(length, (index)=>seed);
}

/// 生成随机数向量
///
/// Create a vector instance with random elements
Vector randomVector(int length) {
  var random = Random();
  return Vector.generate(length, (index) => random.nextDouble());
}

/// 快速生成0到n的向量
Vector zeroToN(int n) {
  Vector result = [];
  for (; n >= 0; n--) {
    result.insert(n, result.length.toDouble());
  }
  return result;
}

/// 快速生成1到n的向量
Vector oneToN(int n) {
  Vector result = [];
  for (; n > 0; n--) {
    result.insert(n, result.length.toDouble());
  }
  return result;
}

/// 快速生成m到n的向量
Vector mToN(int m, int n) {
  Vector result = [];
  for (; n >= m; n--) {
    result.insert(n, result.length.toDouble());
  }
  return result;
}

/// 快速生成从m开始的n个元素的数组，步长为x
Vector mToNbyX(int m, int n, int x) {
  Vector result = [];
  for (; n > 0; n--) {
    result.insert(n, result.length.toDouble());
  }
  return result;
}