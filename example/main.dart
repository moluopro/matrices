import '../lib/matrices.dart';

void main(List<String> args) {
  // Create matrix
  createMatrix();
  createZeros();
  createOnes();
  createNumbers();
  createRandom();

  // Get element, row(s) or column(s)
  queryElement();
  queryRow();
  queryColumn();

  // Transpose, row echelon form & rank
  transpose;
  rowEchelonForm;
  rank;

  // Update element, row(s) or column(s)
  updateElement();
  updateRow();
  updateColumn();

  // Insert row(s) or column(s)
  insertRow();
  insertColumn();
  appendRows();
  appendRows();

  // Delete row(s) or column(s)
  deleteRow();
  deleteColumn();
  deleteRows();
  deleteColumns();

  // Arithmetic operations
  addition();
  subtraction();
  scalarMultiplication();
  matrixMultiplication();

  // Create square matrix
  createSquareMatrix();
  createSquareZeros();
  createSquareOnes();
  createSquareNumbers();
  createSquareRandoms();
  diagFromList();
  diagFromNumber();

  // Get determinant, inverse, eigen value & eigen vector
  det();
  inv();
  eig();
  eigVector();
}

/// Create a matrix instance
void createMatrix() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  print(mat);

  // Matrix: 3x4
  // [2.0, 3.0, 3.0, 3.0]
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
}

/// Matrix of zeros
void createZeros() {
  var mat = Matrix.zero(2, 3);

  print(mat);

  // Matrix: 2x3
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
}

/// Matrix of zeros
void createOnes() {
  var mat = Matrix.one(2, 3);

  print(mat);

  // Matrix: 2x3
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
}

/// Matrix of a certain number
void createNumbers() {
  var mat = Matrix.number(9, 2, 3);

  print(mat);

  // Matrix: 2x3
  // [9.0, 9.0, 9.0]
  // [9.0, 9.0, 9.0]
}

/// Matrix of random numbers
void createRandom() {
  var mat = Matrix.random(2, 3);

  print(mat);

  // Matrix: 2x3
  // [0.38224693703597046, 0.5412146597032305, 0.6424342222644003]
  // [0.8491145735932242, 0.6236773300386973, 0.25269555696856316]
}

/// Access item
void queryElement() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  print(mat.matrix[1][2]);

  // 8.0
}

/// Access row
void queryRow() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  print(mat.matrix[0]);

  // [2.0, 3.0, 3.0, 3.0]
}

/// Access column
void queryColumn() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  print(mat.column(0));

  // [2.0, 9.0, 1.0]
}

/// Transpose
void transpose() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  print(mat.transpose);

  // Matrix: 4x3
  // [2.0, 9.0, 1.0]
  // [3.0, 9.0, 1.0]
  // [3.0, 8.0, 2.0]
  // [3.0, 6.0, 9.0]
}

/// Row echelon form
void rowEchelonForm() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  print(mat.rowEchelonForm);

  // Matrix: 3x4
  // [1.0, 0.0, 0.0, 1.5]
  // [0.0, 1.0, 0.0, -7.5]
  // [0.0, 0.0, 1.0, 7.5]
}

/// Rank
void rank() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  print(mat.rank);

  // 3
}

/// Update item
void updateElement() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.matrix[0][0] = 3;

  print(mat.matrix[0]);

  // [3.0, 3.0, 3.0, 3.0]
}

/// Update row
void updateRow() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.matrix[0] = [1, 4, 5, 0];

  print(mat.matrix[0]);

  // [1.0, 4.0, 5.0, 0.0]
}

/// Update column
void updateColumn() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.setColumn([1, 4, 5], 0);

  print(mat);

  // Matrix: 3x4
  // [1.0, 3.0, 3.0, 3.0]
  // [4.0, 9.0, 8.0, 6.0]
  // [5.0, 1.0, 2.0, 9.0]
}

/// Insert row
void insertRow() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.addRow([8, 8, 8, 8], 0);

  print(mat);

  // Matrix: 4x4
  // [8.0, 8.0, 8.0, 8.0]
  // [2.0, 3.0, 3.0, 3.0]
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
}

void insertColumn() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.addColumn([8, 8, 8], 4);

  print(mat);

  // Matrix: 3x5
  // [2.0, 3.0, 3.0, 3.0, 8.0]
  // [9.0, 9.0, 8.0, 6.0, 8.0]
  // [1.0, 1.0, 2.0, 9.0, 8.0]
}

/// Append rows
void appendRows() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  var tail = Matrix.fromList([
    [8, 8, 8, 8],
    [8, 8, 8, 8]
  ]);

  mat.appendRows(tail);

  print(mat);

  // Matrix: 5x4
  // [2.0, 3.0, 3.0, 3.0]
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
  // [8.0, 8.0, 8.0, 8.0]
  // [8.0, 8.0, 8.0, 8.0]
}

/// Append columns
void appendColumn() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  var tail = Matrix.fromList([
    [8, 8],
    [8, 8],
    [8, 8]
  ]);

  mat.appendColumns(tail);

  print(mat);

  // Matrix: 3x6
  // [2.0, 3.0, 3.0, 3.0, 8.0, 8.0]
  // [9.0, 9.0, 8.0, 6.0, 8.0, 8.0]
  // [1.0, 1.0, 2.0, 9.0, 8.0, 8.0]
}

/// Delete row
void deleteRow() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.deleteRow(0);

  print(mat);

  // Matrix: 2x4
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
}

/// Delete column
void deleteColumn() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.deleteColumn(0);

  print(mat);

  // Matrix: 3x3
  // [3.0, 3.0, 3.0]
  // [9.0, 8.0, 6.0]
  // [1.0, 2.0, 9.0]
}

/// Delete rows
///
/// While deleting rows, the indexs MUST be put in order FROM SMALLEST TO LARGEST.
void deleteRows() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.deleteRows([0, 1]);

  print(mat);

  // Matrix: 1x4
  // [1.0, 1.0, 2.0, 9.0]
}

/// Delete columns
///
/// While deleting columns, the indexs MUST be put in order FROM SMALLEST TO LARGEST.
void deleteColumns() {
  var mat = Matrix.fromList([
    [2, 3, 3, 3],
    [9, 9, 8, 6],
    [1, 1, 2, 9]
  ]);

  mat.deleteColumns([0, 2]);

  print(mat);

  // Matrix: 3x2
  // [3.0, 3.0]
  // [9.0, 6.0]
  // [1.0, 9.0]
}

/// Addition
void addition() {
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);

  print(mat + 3);

  print(mat + mat);
}

/// Subtraction
void subtraction() {
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);

  print(mat - 3);
}

/// Scalar matrix multiplication
///
/// The scalar number MUST be in the right position
void scalarMultiplication() {
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);

  print(mat * 3);

  // Matrix: 2x3
  // [6.0, 9.0, 9.0]
  // [3.0, 6.0, 27.0]
}

/// Matrix multiplication
void matrixMultiplication() {
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);

  var multi = Matrix.fromList([
    [2, 3.5],
    [1, -2],
    [-4, 0.5]
  ]);

  print(mat * multi);

  // Matrix: 2x2
  // [-5.0, 2.5]
  // [-32.0, 4.0]
}

/// Create a square matrix
void createSquareMatrix() {
  var mat = SquareMatrix.fromList([
    [2, 3, 3],
    [1, 2, 9],
    [9, 8, 6]
  ]);

  print(mat);

  // Matrix: 3x3
  // [6.0, 9.0, 9.0]
  // [3.0, 6.0, 27.0]
  // [27.0, 24.0, 18.0]
}

/// SquareMatrix of zeros
void createSquareZeros() {
  var mat = SquareMatrix.zero(3);

  print(mat);

  // SquareMatrix: 3x3
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
}

/// SquareMatrix of ones
void createSquareOnes() {
  var mat = SquareMatrix.one(3);

  print(mat);

  // SquareMatrix: 3x3
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
}

/// SquareMatrix of a certain number
void createSquareNumbers() {
  var mat = SquareMatrix.number(2, 3);

  print(mat);

  // SquareMatrix: 3x3
  // [2.0, 2.0, 2.0]
  // [2.0, 2.0, 2.0]
  // [2.0, 2.0, 2.0]
}

/// SquareMatrix of random numbers
void createSquareRandoms() {
  var mat = SquareMatrix.random(3);

  print(mat);

  // SquareMatrix: 3x3
  // [0.2666268534804871, 0.607635195280705, 0.581392153915932]
  // [0.3590813328566256, 0.8098420655296595, 0.015949886001227154]
  // [0.6670401483574298, 0.3054732396044414, 0.3113168618967712]
}

/// Create diagonal square matrix from list
void diagFromList() {
  var mat = SquareMatrix.diagonal([1, 2, 3]);

  print(mat);

  // SquareMatrix: 3x3
  // [1.0, 0.0, 0.0]
  // [0.0, 2.0, 0.0]
  // [0.0, 0.0, 3.0]
}

/// Create diagonal square matrix from number
void diagFromNumber() {
  var mat = SquareMatrix.diagonalFromNumber(2, 3);

  print(mat);

  // SquareMatrix: 3x3
  // [2.0, 0.0, 0.0]
  // [0.0, 2.0, 0.0]
  // [0.0, 0.0, 2.0]
}

/// Determinant
void det() {
  var dett = SquareMatrix.fromList([
    [1, 2],
    [1, 1]
  ]);

  print(dett.determinant);

  // -1.0
}

/// Inverse
void inv() {
  var dett = SquareMatrix.fromList([
    [1, 2],
    [1, 1]
  ]);

  print(dett.inverse);

  // SquareMatrix: 2x2
  // [1.0, -1.0]
  // [1.0, -1.0]
}

/// Eigenvalues
void eig() {
  print("Unimplemented function.");
}

/// Eigenvectors
void eigVector() {
  print("Unimplemented function.");
}
