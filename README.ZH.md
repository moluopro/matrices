## Matrices - Dart矩阵运算和线性代数库  

****

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Matrices是一个Dart语言的矩阵运算和线性代数库。开发它的目的是为Astable等项目提供矩阵运算支持。目前所有运算均使用Dart语言实现。使用时需要导入matrices.dart文件。另外，在使用Matrices之前，您需要了解线性代数的相关概念。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;线性代数是数学的一个分支，它的研究对象是向量、线性空间、线性变换和有限维的线性方程组。线性代数主要处理线性关系问题。线性关系意即数学对象之间的关系是以一次形式来表达的。由于科学研究中的非线性模型通常可以被近似为线性模型，因此线性代数被广泛地应用于自然科学和社会科学中。  

****

## 简单使用  

```dart
  /// Creating a matrix

  var mat = Matrix.fromList([
    [1, 2, 3],
    [4, 5, 6]
  ]);
  print( mat );

  // Matrix: 2x4
  // [1.0, 2.0, 3.0]
  // [4.0, 5.0, 6.0]


  /// Addition

  print( mat + 3 );
  print( mat + mat );

  // Matrix: 2x3
  // [4.0, 5.0, 6.0]
  // [7.0, 8.0, 9.0]

  // Matrix: 2x3
  // [2.0, 4.0, 6.0]
  // [8.0, 10.0, 12.0]


  /// Subtraction

  var mat1 = Matrix.fromList([
    [1, 2, 1],
    [1, 2, 1]
  ]);
  print( mat - 3 );
  print( mat - mat1 );

  // Matrix: 2x3
  // [-2.0, -1.0, 0.0]
  // [1.0, 2.0, 3.0]

  // Matrix: 2x3
  // [0.0, 0.0, 2.0]
  // [3.0, 3.0, 5.0]


  /// Scalar Multiplication

  // Note: Scalar should be on the right position of the operator *
  print( mat * 3 );

  // Matrix: 2x3
  // [3.0, 6.0, 9.0]
  // [12.0, 15.0, 18.0]


  /// Matrix Product
  var mat2 = Matrix.fromList([
    [2, 3.5],
    [1, -2],
    [-4, 0.5]
  ]);
  print( mat * mat2 );

  // Matrix: 2x2
  // [-8.0, 1.0]
  // [-11.0, 7.0]
```

## 详细  
请点击 [Matrices文档](https://abandoft.gitee.io/matrices/) 查看  