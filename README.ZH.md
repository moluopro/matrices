# Matrices - Dart矩阵运算和线性代数库  
> [English Doc](https://github.com/Abandoft/Matrices/blob/master/README.md) &nbsp;&nbsp;&nbsp;[English Doc(Gitee)](https://gitee.com/abandoft/matrices/blob/master/README.md)  
> 灰度功能使用 ! 标记，未实现功能使用 * 进行标记  
> 1.2.0版本发布了重大更新！由于存在少量对兼容性的破坏，此前版本的用户请查阅文档后再进行升级。

****

<details>
<summary>目录</summary>

- [Matrices简介](#matrices简介)
- [矩阵类Matrix](#矩阵类matrix)
  - [Matrix类说明](#matrix类说明)
  - [创建Matrix对象](#创建matrix对象)
    - [创建矩阵](#创建矩阵)
    - [元素全为0的矩阵](#元素全为0的矩阵)
    - [元素全为1的矩阵](#元素全为1的矩阵)
    - [元素全为某数字的矩阵](#元素全为某数字的矩阵)
    - [元素为某个数组的矩阵](#元素为某个数组的矩阵)
    - [元素全为随机数的矩阵](#元素全为随机数的矩阵)
  - [查询](#查询)
    - [获取某个元素](#获取某个元素)
    - [获取矩阵的行数](#获取矩阵的行数)
    - [获取矩阵的列数](#获取矩阵的列数)
    - [获取矩阵的元素总数](#获取矩阵的元素总数)
    - [获取矩阵的元素的最大值](#获取矩阵的元素的最大值)
    - [获取矩阵的元素的最小值](#获取矩阵的元素的最小值)
    - [获取某一行元素](#获取某一行元素)
    - [获取某一列元素](#获取某一列元素)
    - [转置矩阵](#转置矩阵)
    - [行阶梯形](#行阶梯形)
    - [矩阵的秩](#矩阵的秩)
    - [截取矩阵为方阵](#截取矩阵为方阵)
  - [修改](#修改)
    - [修改某个元素](#修改某个元素)
    - [修改某一行元素](#修改某一行元素)
    - [修改某一列元素](#修改某一列元素)
  - [增加](#增加)
    - [增加一行元素](#增加一行元素)
    - [增加一列元素](#增加一列元素)
    - [按行追加一个矩阵的每一行](#按行追加一个矩阵的每一行)
    - [按列追加一个矩阵的每一列](#按列追加一个矩阵的每一列)
  - [删除](#删除)
    - [删除某一行元素](#删除某一行元素)
    - [删除某一列元素](#删除某一列元素)
    - [删除某几行元素](#删除某几行元素)
    - [删除某几列元素](#删除某几列元素)
  - [四则运算](#四则运算)
    - [加法](#加法)
    - [减法](#减法)
    - [数乘\&乘法](#数乘乘法)
  - [注意事项](#注意事项)
- [方阵类SquareMatrix](#方阵类squarematrix)
  - [SquareMatrix类说明](#squarematrix类说明)
  - [创建SquareMatrix对象](#创建squarematrix对象)
    - [创建方阵](#创建方阵)
    - [创建单位矩阵](#创建单位矩阵)
    - [元素全为0的方阵](#元素全为0的方阵)
    - [元素全为1的方阵](#元素全为1的方阵)
    - [元素全为某数字的方阵](#元素全为某数字的方阵)
    - [元素全为随机数的方阵](#元素全为随机数的方阵)
    - [主对角线元素的值为某数组的对角阵](#主对角线元素的值为某数组的对角阵)
    - [主对角线元素的值为某数字的对角阵](#主对角线元素的值为某数字的对角阵)
  - [查询](#查询-1)
    - [行列式的值](#行列式的值)
    - [逆矩阵](#逆矩阵)
    - [特征值 \*](#特征值-)
    - [特征向量 \*](#特征向量-)
  - [注意事项](#注意事项-1)

</details>

****
## Matrices简介

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Matrices是一个Dart语言的矩阵库。开发它的目的是为Astable等项目提供矩阵运算支持。目前所有运算均使用Dart语言实现。使用时需要先导入matrix.dart文件。

****

## 矩阵类Matrix

### Matrix类说明

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Matrix类里提供了所有类型的矩阵共有的方法，如创建一般矩阵、查询矩阵的元素或某行某列并对其进行修改，拼接向量或矩阵到原矩阵。但是，Matrix类未提供方阵特有的方法，比如求矩阵行列式的值、求逆矩阵、求特征值等。我们不提供向量的概念，请使用 List< double > 类型代替。禁止使用Matrix()构造方法创建矩阵，只允许使用文档里提供的命名构造方法。

### 创建Matrix对象

#### 创建矩阵
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
#### 元素全为0的矩阵
```dart
  /// Matrix.zero(int row, int column)

  var mat = Matrix.zero(2, 3);
  print( mat );

  // Matrix: 2x3
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
```
#### 元素全为1的矩阵
```dart
  /// Matrix.one(int row, int column)

  var mat = Matrix.one(2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
```
#### 元素全为某数字的矩阵
```dart
  /// Matrix.number(double number, int row, int column)

  var mat = Matrix.number(9, 2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [9.0, 9.0, 9.0]
  // [9.0, 9.0, 9.0]
```
#### 元素为某个数组的矩阵
```dart
  // Matrix.fromFlattenedList(List<double> list, int row, int column)
  // 如果数组元素的数量不足，则用0补全矩阵
  
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
```
#### 元素全为随机数的矩阵
```dart
  /// Matrix.random(int row, int column)

  var mat = Matrix.random(2, 3);
  print( mat );
  
  // Matrix: 2x3
  // [0.38224693703597046, 0.5412146597032305, 0.6424342222644003]
  // [0.8491145735932242, 0.6236773300386973, 0.25269555696856316]
```


### 查询
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
以mat矩阵作为例子进行演示
```dart
Matrix mat 3x4
    [2, 3, 3, 3]
    [9, 9, 8, 6]
    [1, 1, 2, 9]
```
#### 获取某个元素
```dart
  print( mat.matrix[1][2] );

  // 8.0
```
#### 获取矩阵的行数
```dart
  print( mat.rowCount );

  // 3
```
#### 获取矩阵的列数
```dart
  print( mat.columnCount );

  // 4
```
#### 获取矩阵的元素总数
```dart
  print( mat.count );

  // 12
```
#### 获取矩阵的元素的最大值
```dart
  print( mat.max );

  // 9.0
```
#### 获取矩阵的元素的最小值
```dart
  print( mat.min );

  // 1.0
```
#### 获取某一行元素
```dart
  print( mat.row(0) );    

  // [2.0, 3.0, 3.0, 3.0]
```
#### 获取某一列元素
```dart
  /// List<double> column(int column)

  print( mat.column(0) );

  // [2.0, 9.0, 1.0]  
```
#### 转置矩阵
```dart
  /// Matrix transpose()

  print( mat.transpose() );

  // Matrix: 4x3
  // [2.0, 9.0, 1.0]
  // [3.0, 9.0, 1.0]
  // [3.0, 8.0, 2.0]
  // [3.0, 6.0, 9.0]
```
#### 行阶梯形
```dart
  /// Matrix rowEchelonForm()

  print( mat.rowEchelonForm() );

  // Matrix: 3x4
  // [1.0, 0.0, 0.0, 1.5]
  // [0.0, 1.0, 0.0, -7.5]
  // [0.0, 0.0, 1.0, 7.5]

```
#### 矩阵的秩
```dart
  /// int rank()

  print( mat.rank() );

  // 3
```
#### 截取矩阵为方阵
```dart
  /// SquareMatrix toSquare()

  print( mat.square );

  // Matrix: 3x4
  // [2.0, 3.0, 3.0]
  // [9.0, 9.0, 8.0]
  // [1.0, 1.0, 2.0]
```
### 修改
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
同样以mat矩阵作为例子进行演示
```dart
Matrix mat 3x4
    [2, 3, 3, 3]
    [9, 9, 8, 6]
    [1, 1, 2, 9]
```
#### 修改某个元素
```dart
  mat.matrix[0][0] = 3;
  print( mat.matrix[0] );

  // [3.0, 3.0, 3.0, 3.0]
```
#### 修改某一行元素
```dart
  /// setRow(List<double> list, int row)

  mat.setRow([1, 4, 5, 0], 0);
  print( mat.matrix[0] );

  // [1.0, 4.0, 5.0, 0.0]
```
#### 修改某一列元素
```dart
  /// setColumn(List<double> list, int column)

  mat.setColumn([1, 4, 5], 0);
  print( mat );

  // Matrix: 3x4
  // [1.0, 3.0, 3.0, 3.0]
  // [4.0, 9.0, 8.0, 6.0]
  // [5.0, 1.0, 2.0, 9.0]
```
### 增加
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
同样以mat矩阵作为例子进行演示
```dart
Matrix mat 3x4
    [2, 3, 3, 3]
    [9, 9, 8, 6]
    [1, 1, 2, 9]
```
#### 增加一行元素
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
#### 增加一列元素
```dart
  /// addColumn(List<double> list, int index)

  mat.addColumn([8, 8, 8], 4);
  print( mat );

  // Matrix: 3x5
  // [2.0, 3.0, 3.0, 3.0, 8.0]
  // [9.0, 9.0, 8.0, 6.0, 8.0]
  // [1.0, 1.0, 2.0, 9.0, 8.0]
```
#### 按行追加一个矩阵的每一行
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
#### 按列追加一个矩阵的每一列
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
### 删除
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
同样以mat矩阵作为例子进行演示
```dart
Matrix mat 3x4
    [2, 3, 3, 3]
    [9, 9, 8, 6]
    [1, 1, 2, 9]
```
#### 删除某一行元素
```dart
  /// deleteRow(int index)

  mat.deleteRow(0);
  print( mat );

  // Matrix: 2x4
  // [9.0, 9.0, 8.0, 6.0]
  // [1.0, 1.0, 2.0, 9.0]
```
#### 删除某一列元素
```dart
  /// deleteColumn(int index)

  mat.deleteColumn(0);
  print( mat );
  
  // Matrix: 3x3
  // [3.0, 3.0, 3.0]
  // [9.0, 8.0, 6.0]
  // [1.0, 2.0, 9.0]
```
#### 删除某几行元素
> PS: 删除多行时，应按照下标从小到大的顺序
```dart
  /// deleteRows(List<int> list)

  mat.deleteRows([0, 1]);
  print( mat );

  // Matrix: 1x4
  // [1.0, 1.0, 2.0, 9.0]
```
#### 删除某几列元素
> PS: 删除多列时，应按照下标从小到大的顺序
```dart
  /// deleteColumns(List<int> list)

  mat.deleteColumns([0, 2]);
  print( mat );

  // Matrix: 3x2
  // [3.0, 3.0]
  // [9.0, 6.0]
  // [1.0, 9.0]
```
### 四则运算
#### 加法
```dart
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);
  print( mat + 3 );
  print( mat + mat );
```
#### 减法
```dart
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);
  print( mat - 3 );
```
#### 数乘&乘法
```dart
  // 数乘(数字应在乘号右侧)
  var mat = Matrix.fromList([
    [2, 3, 3],
    [1, 2, 9]
  ]);
  print( mat * 3 );

  // Matrix: 2x3
  // [6.0, 9.0, 9.0]
  // [3.0, 6.0, 27.0]


  // 矩阵乘法
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
### 注意事项

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

****

## 方阵类SquareMatrix

### SquareMatrix类说明

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
SquareMatrix类的对象可以使用矩阵类的所有属性和方法。同时，SquareMatrix类包含一些方阵特有的属性和方法，如快速创建一个方阵、求方阵的行列式的值、逆矩阵、特征值、特征向量等。

### 创建SquareMatrix对象

#### 创建方阵
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
#### 创建单位矩阵
```dart
  // SquareMatrix.identity(int row)

  var mat = SquareMatrix.identity(3);
  print(mat);

  // SquareMatrix: 3x3
  // [1.0, 0.0, 0.0]
  // [0.0, 1.0, 0.0]
  // [0.0, 0.0, 1.0]
```
#### 元素全为0的方阵
```dart
  /// SquareMatrix.zero(int row)

  var mat = SquareMatrix.zero(3);
  print( mat );

  // SquareMatrix: 3x3
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
  // [0.0, 0.0, 0.0]
```
#### 元素全为1的方阵
```dart
  /// SquareMatrix.one(int row)

  var mat = SquareMatrix.one(3);
  print( mat );

  // SquareMatrix: 3x3
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
  // [1.0, 1.0, 1.0]
```
#### 元素全为某数字的方阵
```dart
  /// SquareMatrix.number(double number, int row)

  var mat = SquareMatrix.number(2, 3);
  print( mat );

  // SquareMatrix: 3x3
  // [2.0, 2.0, 2.0]
  // [2.0, 2.0, 2.0]
  // [2.0, 2.0, 2.0]
```
#### 元素全为随机数的方阵
```dart
  /// SquareMatrix.random(int row)

  var mat = SquareMatrix.random(3);
  print( mat );

  // SquareMatrix: 3x3
  // [0.2666268534804871, 0.607635195280705, 0.581392153915932]
  // [0.3590813328566256, 0.8098420655296595, 0.015949886001227154]
  // [0.6670401483574298, 0.3054732396044414, 0.3113168618967712]
```
#### 主对角线元素的值为某数组的对角阵
```dart
  /// SquareMatrix.diagonal(List<double> list)

  var mat = SquareMatrix.diagonal([1,2,3]);
  print( mat );

  // SquareMatrix: 3x3
  // [1.0, 0.0, 0.0]
  // [0.0, 2.0, 0.0]
  // [0.0, 0.0, 3.0]
```
#### 主对角线元素的值为某数字的对角阵
```dart
  /// SquareMatrix.diagonalFromNumber(double num, int row)

  var mat = SquareMatrix.diagonalFromNumber(2,3);
  print( mat );

  // SquareMatrix: 3x3
  // [2.0, 0.0, 0.0]
  // [0.0, 2.0, 0.0]
  // [0.0, 0.0, 2.0]
```
### 查询
#### 行列式的值
```dart
  /// double determinant()

  var dett = SquareMatrix.fromList([
    [1, 2],
    [1, 1]
  ]);
  print(dett.determinant());

  // -1.0
```
#### 逆矩阵
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
#### 特征值 *
```dart
  /// double eigenvalue()
```
#### 特征向量 *
```dart
  /// Matrix eigenvector()
```
### 注意事项
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
特征值和特征向量当前版本暂未提供。

****

## 赞助我们 ❤  
您可以点击&nbsp;[PayPal](https://paypal.me/abandoft)&nbsp;支付或使用APP扫码赞助我们：
****
![](https://s3.bmp.ovh/imgs/2023/01/02/5c2b370ac00d8bd9.png)  
****