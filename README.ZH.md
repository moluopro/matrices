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

  /// Creating a matrix filled with 0’s

  var mat = Matrix.zero(2, 3);
  print( mat );

  // Matrix: 2x3
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]

  /// Creating a matrix filled with 1’s

  var mat = Matrix.one(2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]

  /// Creating a matrix filled with certain value

  var mat = Matrix.number(9, 2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [9.0, 9.0, 9.0]
  // [9.0, 9.0, 9.0]

  /// Creating a matrix from a flattened list
  
  // If the length of the flattened list is smaller than the expected matrix size,
  // zeros will be filled in the vacant position.
  
  var mat1 = Matrix.fromFlattenedList([1, 2, 3, 4], 2, 2);
  var mat2 = Matrix.fromFlattenedList([1, 2, 3, 4], 2, 3);
  print(mat1);
  print(mat2);

  // Matrix: 2x2
  // [1.0, 2.0]
  // [3.0, 4.0]

  // Matrix: 2x3
  // [1.0, 2.0, 3.0]
  // [4.0, 0.0, 0.0]

  /// Creating a matrix filled with random values

  var mat = Matrix.random(2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [0.38224693703597046, 0.5412146597032305, 0.6424342222644003]
  // [0.8491145735932242, 0.6236773300386973, 0.25269555696856316]

  /// Addition

  print( mat + 3 );
  print( mat + mat );

  // Matrix: 2x3
  // [4.0, 5.0, 6.0]
  // [7.0, 8.0, 9.0]

  // Matrix: 2x3
  // [2.0, 4.0, 6.0]
  // [8.0, 10.0, 12.0]

  /// Take the matrix mat as example
  Matrix mat 2x4
      [1, 2, 3, 4]
      [5, 6, 7, 8]

  /// Indexing a matrix element
  print( mat[1][2] );

  // 7.0

  /// Number of rows
  print( mat.rowCount );

  // 2

  /// Number of columns
  print( mat.columnCount );

  // 4

  /// Total number of elements
  print( mat.count );

  // 8


  /// Slicing a row

  print( mat.row(0) );

  // An easier slicing method
  print( mat[0] );

  // [1.0, 2.0, 3.0, 4.0]
  // [1.0, 2.0, 3.0, 4.0]

  /// Slicing a column
  print( mat.column(0) );

  // Here, we also provide an easier slicing method for columns
  // Add a minus before real column index to slice column (except the 1st column)

  // Slicing the 1st column
  print( mat[''] );

  // Slicing the 2nd column
  print( mat[-1] );

  // [1.0, 5.0]
  // [1.0, 5.0]
  // [2.0, 6.0]

  /// Transposing
  print( mat.transpose );

  // Matrix: 4x2
  // [1.0, 5.0]
  // [2.0, 6.0]
  // [3.0, 7.0]
  // [4.0, 8.0]

  /// Row Echelon Form
  print( mat.rowEchelonForm );

  // Matrix: 2x4
  // [1.0, 0.0, -1.00000, -2.00000]
  // [0.0, 1.0, 2.00000, 3.00000]


  /// Rank
  print( mat.rank );

  // 2

  /// Take the matrix mat as example, too.
  Matrix mat 2x4
      [1, 2, 3, 4]
      [5, 6, 7, 8]

  /// Modify an element
  mat[0][0] = 6;
  print( mat[0] );

  // [6.0, 2.0, 3.0, 4.0]

  /// Modify a row
  mat.setRow([6, 6, 6, 6], 0);
  print( mat[0] );

  // [6.0, 6.0, 6.0, 6.0]

  // A eaiser way to modify a row
  mat[0] = [8, 8, 8, 8];
  print( mat[0] );

  // [8.0, 8.0, 8.0, 8.0]

  /// Modify a column
  mat.setColumn([6, 6], 0);
  print( mat );

  // Matrix: 2x4
  // [6.0, 2.0, 3.0, 4.0]
  // [6.0, 6.0, 7.0, 8.0]

  // A eaiser way to modify a column
  // Add a minus before real column index to modify column (except the 1st column which requires an empty string)
  mat[''] = [8, 8];
  mat[-1] = [9, 9];
  print( mat );

  // Matrix: 2x4
  // [8.0, 9.0, 3.0, 4.0]
  // [8.0, 9.0, 7.0, 8.0]

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

  /// 这只是Matrices的简单入门，进一步使用请翻阅文档！

```

## 进阶用法  
点击 [Matrices文档](https://abandoft.gitee.io/matrices/) 探索精彩的矩阵世界