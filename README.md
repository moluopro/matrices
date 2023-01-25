## Matrices - Matrix Operations and Linear Algebra Library for Dart  

****

&nbsp;&nbsp;&nbsp;&nbsp;Matrices is a matrix operations and linear algebra library for Dart. It was developed to provide matrix operations support for projects such as Astable. All operations are currently implemented in Dart language. To use it, you need to import the matrices.dart file. Also, before using Matrices, you need to understand the concepts related to linear algebra.  

&nbsp;&nbsp;&nbsp;&nbsp;Linear algebra is a branch of mathematics that deals with vectors, linear spaces, linear transformations and finite dimensional systems of linear equations. Linear algebra deals with linear relations. A linear relationship means that the relationship between mathematical objects is expressed in a one-time form. Since nonlinear models in scientific research can often be approximated as linear models, linear algebra is widely used in the natural and social sciences.    

****

## Getting Started  

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


## User Guide  
Please click [Matrices Document](https://abandoft.gitee.io/matrices/) to view