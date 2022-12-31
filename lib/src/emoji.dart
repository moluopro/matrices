/// Magic Emoji Methods(Deprecated)
/// 神奇的表情包方法(已废弃)

/// 快速生成0到n的向量
List<double> o_n(int n) {
  List<double> result = [];
  for (; n >= 0; n--) {
    result.insert(n, result.length.toDouble());
  }
  return result;
}

/// 快速生成1到n的向量
List<double> l_n(int n) {
  List<double> result = [];
  for (; n > 0; n--) {
    result.insert(n, result.length.toDouble());
  }
  return result;
}

/// 快速生成m到n的向量
List<double> m_n(int m, int n) {
  List<double> result = [];
  for (; n >= m; n--) {
    result.insert(n, result.length.toDouble());
  }
  return result;
}

/// 快速生成从m开始的n个元素的数组，步长为l
List<double> l_m_n(int m, int n) {
  List<double> result = [];
  for (; n > 0; n--) {
    result.insert(n, result.length.toDouble());
  }
  return result;
}
