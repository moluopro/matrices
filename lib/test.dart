import './matrices.dart';

void main(List<String> args) {
  /// 创建向量类型的变量
  Vector vec = [1, 2, 3];
  print(vec);
  // [1.0, 2.0, 3.0]

  /// 获取向量的元素
  print(vec[1]);

  /// 修改向量元素的值
  vec[1] = 6;
  print(vec[1]);
}
