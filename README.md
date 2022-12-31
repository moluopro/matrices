Matrices - Dart Matrix Computing Library
> [中文文档](https://github.com/Abandoft/Matrices/blob/master/README.ZH.md)  [中文Gitee文档](https://gitee.com/abandoft/matrices/blob/master/README.ZH.md)  
> Grayscale releases are marked with '!'  
> Unimplemented functions are marked with '*'  
> Usage: https://pub.dev/packages/matrices

****
**CONTENT**
- [Matrices introduction](#matrices-introduction)
- [Matrix class](#matrix-class)
  - [Illustrations of Matrix class](#illustrations-of-matrix-class)
  - [Create a Matrix instance](#create-a-matrix-instance)
    - [Create a matrix](#create-a-matrix)
    - [Matrix of zeros](#matrix-of-zeros)
    - [Matrix of ones](#matrix-of-ones)
    - [Matrix of a certain number](#matrix-of-a-certain-number)
    - [Matrix of random numbers](#matrix-of-random-numbers)
  - [Select](#select)
    - [Access item](#access-item)
    - [Access row](#access-row)
    - [Access column](#access-column)
    - [Transpose](#transpose)
    - [Row-echelon form](#row-echelon-form)
    - [Rank](#rank)
  - [Update](#update)
    - [Update item](#update-item)
    - [Update row](#update-row)
    - [Update column](#update-column)
  - [Insert](#insert)
    - [Insert row](#insert-row)
    - [Insert column](#insert-column)
    - [Append rows](#append-rows)
    - [Append columns](#append-columns)
  - [Delete](#delete)
    - [Delete row](#delete-row)
    - [Delete column](#delete-column)
    - [Delete rows](#delete-rows)
    - [Delete columns](#delete-columns)
  - [Arithmetic operations](#arithmetic-operations)
    - [Addition](#addition)
    - [Subtraction](#subtraction)
    - [Multiplication](#multiplication)
  - [Caution!](#caution)
  - [Follow-up plan](#follow-up-plan)
- [SquareMatrix class](#squarematrix-class)
  - [Illustrations of SquareMatrix class](#illustrations-of-squarematrix-class)
  - [Createa a SquareMatrix instance](#createa-a-squarematrix-instance)
    - [Create a square matrix](#create-a-square-matrix)
    - [SquareMatrix of zeros](#squarematrix-of-zeros)
    - [SquareMatrix of ones](#squarematrix-of-ones)
    - [SquareMatrix of a certain number](#squarematrix-of-a-certain-number)
    - [SquareMatrix of random numbers](#squarematrix-of-random-numbers)
    - [Create diagonal square matrix from list](#create-diagonal-square-matrix-from-list)
    - [Create diagonal square matrix from number](#create-diagonal-square-matrix-from-number)
  - [Special properties of square matrix](#special-properties-of-square-matrix)
    - [Determinant !](#determinant-)
    - [Inverse !](#inverse-)
    - [Eigenvalues \*](#eigenvalues-)
    - [Eigenvectors \*](#eigenvectors-)
  - [Caution!](#caution-1)
  - [Follow-up plan](#follow-up-plan-1)


****

## Matrices introduction

&nbsp;&nbsp;&nbsp;&nbsp;

Matrices is a matrix library written purely in Dart. It is developed to provide support for projects like Astable which requires mathematical computation. It is now in the very early age, and its API may change frequently.

****

## Matrix class

&nbsp;&nbsp;&nbsp;&nbsp;

The matrix class provides all the methods shared by any types of matrix like vector, square matrix or non-square matrix. For example, methods are provided to create a matrix, to query or update element at certain position, to append a row or column to the existing matrix, etc. However, it does not provides methods special for a square matrix.
Importing 'Matrix.dart' is required before using methods listed below.

### Illustrations of Matrix class

&nbsp;&nbsp;&nbsp;&nbsp;

The Matrix class only has one public field - 'Matrix' whose runtimetype is List<List<double>>. Thus, the operation of updating the matrix is the same as the operation on a 'list' instance.
However, you are NOT ALLOWED to initialize a Matrix instance through Matrix() conctructor. Instead, a few named constructors are provided for initialization of a Matrix instance.

### Create a Matrix instance

#### Create a matrix
```dart
  /// Matrix.fromList(List<List<double>> lists)

  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);
  print( mat );

  // Matrix: 3x4
  // [2.0, 3.0, 3.0, 3.0]
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
```
#### Matrix of zeros
```dart
  /// Matrix.zero(int row, int column)

  var mat = Matrix.zero(2, 3);
  print( mat );

  // Matrix: 2x3
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
```
#### Matrix of ones
```dart
  /// Matrix.one(int row, int column)

  var mat = Matrix.one(2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
```
#### Matrix of a certain number
```dart
  /// Matrix.number(double number, int row, int column)

  var mat = Matrix.number(9, 2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [9.0, 9.0, 9.0]
  // [9.0, 9.0, 9.0]
```
#### Matrix of random numbers
```dart
  /// Matrix.random(int row, int column)

  var mat = Matrix.random(2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [0.38224693703597046, 0.5412146597032305, 0.6424342222644003]
  // [0.8491145735932242, 0.6236773300386973, 0.25269555696856316]
```


### Select
&nbsp;&nbsp;&nbsp;&nbsp;

Taking the matrix 'mat' as example.

```dart
Matrix mat 3x4
    [2, 3, 3, 3]
    [9, 9, 8, 6]
    [1, 1, 2, 9]
```
#### Access item
```dart
  print( mat.matrix[1][2] );

  // 8.0
```
#### Access row
```dart
  print( mat.matrix[0] );    

  // [2.0, 3.0, 3.0, 3.0]
```
#### Access column
```dart
  /// List<double> column(int column)

  print( mat.column(0) );

  // [2.0, 9.0, 1.0]  
```
#### Transpose
```dart
  /// Matrix transpose()

  print( mat.transpose() );

  // Matrix: 4x3
  // [2.0, 9.0, 1.0]
  // [3.0, 9.0, 1.0]
  // [3.0, 8.0, 2.0]
  // [3.0, 6.0, 9.0]
```
#### Row-echelon form
```dart
  /// Matrix rowEchelonForm()

  print( mat.rowEchelonForm() );

  // Matrix: 3x4
  // [1.0, 0.0, 0.0, 1.5]
  // [0.0, 1.0, 0.0, -7.5]
  // [0.0, 0.0, 1.0, 7.5]

```
#### Rank
```dart
  /// int rank()

  print( mat.rank() );

  // 3
```
### Update
&nbsp;&nbsp;&nbsp;&nbsp;

Taking the matrix 'mat' as example.

```dart
Matrix mat 3x4
    [2, 3, 3, 3]
    [9, 9, 8, 6]
    [1, 1, 2, 9]
```
#### Update item
```dart
  mat.matrix[0][0] = 3;
  print( mat.matrix[0] );

  // [3.0, 3.0, 3.0, 3.0]
```
#### Update row
```dart
  /// setRow(List<double> list, int row)

  mat.setRow([1, 4, 5, 0], 0);
  print( mat.matrix[0] );

  // [1.0, 4.0, 5.0, 0.0]
```
#### Update column
```dart
  /// setColumn(List<double> list, int column)

  mat.setColumn([1, 4, 5], 0);
  print( mat );

  // Matrix: 3x4
  // [1.0, 3.0, 3.0, 3.0]
  // [4.0, 9.0, 8.0, 6.0]
  // [5.0, 1.0, 2.0, 9.0]
```
### Insert
&nbsp;&nbsp;&nbsp;&nbsp;

Taking the matrix 'mat' as example.

```dart
Matrix mat 3x4
    [2, 3, 3, 3]
    [9, 9, 8, 6]
    [1, 1, 2, 9]
```
#### Insert row
```dart
  /// addRow(List<double> list, int index)

  mat.addRow([8,8,8,8], 0);
  print( mat );

  // Matrix: 4x4
  // [8.0, 8.0, 8.0, 8.0]
  // [2.0, 3.0, 3.0, 3.0]
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
```
#### Insert column
```dart
  /// addColumn(List<double> list, int index)

  mat.addColumn([8, 8, 8], 4);
  print( mat );

  // Matrix: 3x5
  // [2.0, 3.0, 3.0, 3.0, 8.0]
  // [9.0, 9.0, 8.0, 6.0, 8.0]
  // [1.0, 1.0, 2.0, 9.0, 8.0]
```
#### Append rows
```dart
  /// appendRows(Matrix injected)

  var tail = Matrix.fromList([
    [8, 8, 8, 8],
    [8, 8, 8, 8]
  ]);
  mat.appendRows(tail);
  print( mat );

  // Matrix: 5x4
  // [2.0, 3.0, 3.0, 3.0]
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
  // [8.0, 8.0, 8.0, 8.0]
  // [8.0, 8.0, 8.0, 8.0]  
```
#### Append columns
```dart
  /// appendColumns(Matrix injected)

  var tail = Matrix.fromList([
    [8, 8],
    [8, 8],
    [8, 8]
  ]);
  mat.appendColumns(tail);
  print( mat );

  // Matrix: 3x6
  // [2.0, 3.0, 3.0, 3.0, 8.0, 8.0]
  // [9.0, 9.0, 8.0, 6.0, 8.0, 8.0]
  // [1.0, 1.0, 2.0, 9.0, 8.0, 8.0]
```
### Delete
&nbsp;&nbsp;&nbsp;&nbsp;

Taking the matrix 'mat' as example.

```dart
Matrix mat 3x4
    [2, 3, 3, 3]
    [9, 9, 8, 6]
    [1, 1, 2, 9]
```
#### Delete row
```dart
  /// deleteRow(int index)

  mat.deleteRow(0);
  print( mat );

  // Matrix: 2x4
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
```
#### Delete column
```dart
  /// deleteColumn(int index)

  mat.deleteColumn(0);
  print( mat );
  
  // Matrix: 3x3
  // [3.0, 3.0, 3.0]
  // [9.0, 8.0, 6.0]
  // [1.0, 2.0, 9.0]
```
#### Delete rows

> PS: While deleting rows, the indexs MUST be put in order FROM SMALLEST TO LARGEST.

```dart
  /// deleteRows(List<int> list)

  mat.deleteRows([0, 1]);
  print( mat );

  // Matrix: 1x4
  // [1.0, 1.0, 2.0, 9.0]
```
#### Delete columns

> PS: While deleting columns, the indexs MUST be put in order FROM SMALLEST TO LARGEST.

```dart
  /// deleteColumns(List<int> list)

  mat.deleteColumns([0, 2]);
  print( mat );

  // Matrix: 3x2
  // [3.0, 3.0]
  // [9.0, 6.0]
  // [1.0, 9.0]
```
### Arithmetic operations
#### Addition
```dart
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);
  print( mat + 3 );
  print( mat + mat );
```
#### Subtraction
```dart
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);
  print( mat - 3 );
```
#### Multiplication
```dart
  // Scalar matrix multiplication (the scalar number MUST be in the right position)
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);
  print( mat * 3 );

  // Matrix: 2x3
  // [6.0, 9.0, 9.0]
  // [3.0, 6.0, 27.0]

  // Matrix multiplication
  var multi = Matrix.fromList([
    [2, 3.5],
    [1, -2],
    [-4, 0.5]
  ]);
  print( mat * multi );

  // Matrix: 2x2
  // [-5.0, 2.5]
  // [-32.0, 4.0]
```
### Caution!

### Follow-up plan

****

## SquareMatrix class

&nbsp;&nbsp;&nbsp;&nbsp;

The SquareMatrix class has methods special for square matrix, like creating a squarematrix instance, calculating the determinant, the inverse, the eigen values and the eigen vectors, etc.
Importing 'SquareMatrix.dart' is required before using methods listed below.

### Illustrations of SquareMatrix class

&nbsp;&nbsp;&nbsp;&nbsp;


### Createa a SquareMatrix instance

#### Create a square matrix
```dart
  /// SquareMatrix.fromList(List<List<double>> lists)

  var mat = SquareMatrix.fromList([
    [2, 3, 3],
    [1, 2, 9],
    [9, 8, 6]
  ]);
  print( mat );

  // Matrix: 3x3
  // [6.0, 9.0, 9.0]
  // [3.0, 6.0, 27.0]
  // [27.0, 24.0, 18.0]
```
#### SquareMatrix of zeros
```dart
  /// SquareMatrix.zero(int row)

  var mat = SquareMatrix.zero(3);
  print( mat );

  // SquareMatrix: 3x3
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
```
#### SquareMatrix of ones
```dart
  /// SquareMatrix.one(int row)

  var mat = SquareMatrix.one(3);
  print( mat );

  // SquareMatrix: 3x3
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
```
#### SquareMatrix of a certain number
```dart
  /// SquareMatrix.number(double number, int row)

  var mat = SquareMatrix.number(2, 3);
  print( mat );

  // SquareMatrix: 3x3
  // [2.0, 2.0, 2.0]
  // [2.0, 2.0, 2.0]
  // [2.0, 2.0, 2.0]
```
#### SquareMatrix of random numbers
```dart
  /// SquareMatrix.random(int row)

  var mat = SquareMatrix.random(3);
  print( mat );

  // SquareMatrix: 3x3
  // [0.2666268534804871, 0.607635195280705, 0.581392153915932]
  // [0.3590813328566256, 0.8098420655296595, 0.015949886001227154]
  // [0.6670401483574298, 0.3054732396044414, 0.3113168618967712]
```
#### Create diagonal square matrix from list
```dart
  /// SquareMatrix.diagonal(List<double> list)

  var mat = SquareMatrix.diagonal([1,2,3]);
  print( mat );

  // SquareMatrix: 3x3
  // [1.0, 0.0, 0.0]
  // [0.0, 2.0, 0.0]
  // [0.0, 0.0, 3.0]
```
#### Create diagonal square matrix from number
```dart
  /// SquareMatrix.diagonalFromNumber(double num, int row)

  var mat = SquareMatrix.diagonalFromNumber(2,3);
  print( mat );

  // SquareMatrix: 3x3
  // [2.0, 0.0, 0.0]
  // [0.0, 2.0, 0.0]
  // [0.0, 0.0, 2.0]
```
### Special properties of square matrix
#### Determinant !
```dart
  /// double determinant()

  var dett = SquareMatrix.fromList([
    [1, 2],
    [1, 1]
  ]);
  print(dett.determinant());

  // -1.0
```
#### Inverse !
```dart
  /// SquareMatrix inverse()

  var dett = SquareMatrix.fromList([
    [1, 2],
    [1, 1]
  ]);
  print(dett.inverse());

  // SquareMatrix: 2x2
  // [1.0, -1.0]
  // [1.0, -1.0]
```
#### Eigenvalues *
```dart
  /// double eigenvalue()
```
#### Eigenvectors *
```dart
  /// Matrix eigenvector()
```
### Caution!

### Follow-up plan