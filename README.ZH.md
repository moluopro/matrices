# Matrices - Dart矩阵运算和线性代数库  
> [English Doc](https://github.com/Abandoft/Matrices/blob/master/README.md) &nbsp;&nbsp;&nbsp;[English Doc(Gitee)](https://gitee.com/abandoft/matrices/blob/master/README.md)  
> 灰度功能使用 ! 标记，未实现功能使用 * 进行标记  
>> 1.2.0版本发布了重大更新！  
>> 由于存在少量对兼容性的破坏，此前版本的用户请查阅文档后再进行升级。  

****

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Matrices是一个Dart语言的线性代数库。开发它的目的是为Astable等项目提供矩阵运算支持。目前所有运算均使用Dart语言实现。使用时需要先导入matrices.dart文件。

****
## 目录

<details><summary>矩阵类Matrix</summary>

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
  - [Matrix注意事项](#Matrix注意事项)

</details>

<details><summary>方阵类SquareMatrix</summary>

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
  - [SquareMatrix查询](#SquareMatrix查询)
    - [行列式的值](#行列式的值)
    - [逆矩阵](#逆矩阵)
    - [特征值 \*](#特征值-)
    - [特征向量 \*](#特征向量-)
  - [SquareMatrix注意事项](#SquareMatrix注意事项)

</details>

<details><summary>向量类型Vector</summary>

- [向量类型Vector](#向量类型vector)
  - [向量类型说明](#向量类型说明)
  - [创建和操作向量](#创建和操作向量)
  - [快速创建特殊向量](#快速创建特殊向量)
  - [Vector注意事项](#Vector注意事项)
  
</details>

****

## 矩阵类Matrix

### Matrix类说明

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Matrix类里提供了所有类型的矩阵共有的方法，如创建一般矩阵、查询矩阵的元素或某行某列并对其进行修改，拼接向量或矩阵到原矩阵等。但是，Matrix类未提供方阵特有的方法，比如求矩阵行列式的值、求逆矩阵、求特征值等。在Matrices中，向量即List< double > 类型，并且矩阵的每一行都是一个向量。Matrices只允许使用文档里提供的命名构造方法创建矩阵，禁止使用Matrix()构造方法。

### 创建Matrix对象

#### 创建矩阵
```dart
  /// Matrix.fromList(List<List<double>> lists)

  var mat = Matrix.fromList([
    [1, 2, 3, 4],
    [5, 6, 7, 8]
  ]);
  print( mat );

  // Matrix: 2x4
  // [1.0, 2.0, 3.0, 4.0]
  // [5.0, 6.0, 7.0, 8.0]
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
Matrix mat 2x4
    [1, 2, 3, 4]
    [5, 6, 7, 8]
```
#### 获取某个元素
```dart
  print( mat[1][2] );

  // 7.0
```
#### 获取矩阵的行数
```dart
  print( mat.rowCount );

  // 2
```
#### 获取矩阵的列数
```dart
  print( mat.columnCount );

  // 4
```
#### 获取矩阵的元素总数
```dart
  print( mat.count );

  // 8
```
#### 获取矩阵的元素的最大值
```dart
  print( mat.max );

  // 8.0
```
#### 获取矩阵的元素的最小值
```dart
  print( mat.min );

  // 1.0
```
#### 获取某一行元素
```dart
  /// List<double> row(int row)
  print( mat.row(0) );

  // 下面是简单写法
  print( mat[0] );

  // [1.0, 2.0, 3.0, 4.0]
  // [1.0, 2.0, 3.0, 4.0]
```
#### 获取某一列元素
```dart
  /// List<double> column(int column)
  print( mat.column(0) );

  // 也提供了一种简单写法
  // 除第0列外，去掉负号就是列的实际索引

  // 获取第0列元素
  print( mat[''] );
  // 获取第1列元素
  print( mat[-1] );

  // [1.0, 5.0]
  // [1.0, 5.0]
  // [2.0, 6.0]
```
#### 转置矩阵
```dart
  print( mat.transpose );

  // Matrix: 4x2
  // [1.0, 5.0]
  // [2.0, 6.0]
  // [3.0, 7.0]
  // [4.0, 8.0]
```
#### 行阶梯形
```dart
  print( mat.rowEchelonForm );

  // Matrix: 2x4
  // [1.0, 0.0, -1.00000, -2.00000]
  // [0.0, 1.0, 2.00000, 3.00000]

```
#### 矩阵的秩
```dart
  print( mat.rank );

  // 2
```
#### 截取矩阵为方阵
```dart
  print( mat.square );

  // SquareMatrix: 2x2
  // [1.0, 2.0]
  // [5.0, 6.0]
```
### 修改
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
同样以mat矩阵作为例子进行演示
```dart
Matrix mat 2x4
    [1, 2, 3, 4]
    [5, 6, 7, 8]
```
#### 修改某个元素
```dart
  mat[0][0] = 6;
  print( mat[0] );

  // [6.0, 2.0, 3.0, 4.0]
```
#### 修改某一行元素
```dart
  /// setRow(List<double> list, int row)
  mat.setRow([6, 6, 6, 6], 0);
  print( mat[0] );

  // [6.0, 6.0, 6.0, 6.0]

  // 也有一种简单的方式
  mat[0] = [8, 8, 8, 8];
  print( mat[0] );

  // [8.0, 8.0, 8.0, 8.0]
```
#### 修改某一列元素
```dart
  /// setColumn(List<double> list, int column)
  mat.setColumn([6, 6], 0);
  print( mat );

  // Matrix: 2x4
  // [6.0, 2.0, 3.0, 4.0]
  // [6.0, 6.0, 7.0, 8.0]

  // 也有一种简单的方式
  // 除第0列外，去掉负号就是列的实际索引
  mat[''] = [8, 8];
  mat[-1] = [9, 9];
  print( mat );

  // Matrix: 2x4
  // [8.0, 9.0, 3.0, 4.0]
  // [8.0, 9.0, 7.0, 8.0]
```
### 增加
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
同样以mat矩阵作为例子进行演示
```dart
Matrix mat 2x4
    [1, 2, 3, 4]
    [5, 6, 7, 8]
```
#### 增加一行元素
```dart
  /// addRow(List<double> list, int index)

  mat.addRow([8,8,8,8], 0);
  print( mat );

  // Matrix: 3x4
  // [8.0, 8.0, 8.0, 8.0]
  // [1.0, 2.0, 3.0, 4.0]
  // [5.0, 6.0, 7.0, 8.0]
```
#### 增加一列元素
```dart
  /// addColumn(List<double> list, int index)

  mat.addColumn([8, 8], 1);
  print( mat );

  // Matrix: 2x5
  // [1.0, 8.0, 2.0, 3.0, 4.0]
  // [5.0, 8.0, 6.0, 7.0, 8.0]
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

  // Matrix: 4x4
  // [1.0, 2.0, 3.0, 4.0]
  // [5.0, 6.0, 7.0, 8.0]
  // [8.0, 8.0, 8.0, 8.0]
  // [8.0, 8.0, 8.0, 8.0]
```
#### 按列追加一个矩阵的每一列
```dart
  /// appendColumns(Matrix injected)

  var tail = Matrix.fromList([
    [8, 9],
    [8, 9]
  ]);
  mat.appendColumns(tail);
  print( mat );

  // Matrix: 2x6
  // [1.0, 2.0, 3.0, 4.0, 8.0, 9.0]
  // [5.0, 6.0, 7.0, 8.0, 8.0, 9.0]
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

  // Matrix: 1x4
  // [5.0, 6.0, 7.0, 8.0]
```
#### 删除某一列元素
```dart
  /// deleteColumn(int index)

  mat.deleteColumn(0);
  print( mat );
  
  // Matrix: 2x3
  // [2.0, 3.0, 4.0]
  // [6.0, 7.0, 8.0]
```
#### 删除某几行元素
> PS: 删除多行时，应按照索引从小到大的顺序
```dart
  /// deleteRows(List<int> list)

  // 先增加一行元素
  // 再删除第0行和第1行
  mat.addRow([6, 6, 6, 6], 1);
  print( mat );
  mat.deleteRows([0, 1]);
  print( mat );

  // Matrix: 3x4
  // [1.0, 2.0, 3.0, 4.0]
  // [6.0, 6.0, 6.0, 6.0]
  // [5.0, 6.0, 7.0, 8.0]

  // Matrix: 1x4
  // [5.0, 6.0, 7.0, 8.0]
```
#### 删除某几列元素
> PS: 删除多列时，应按照索引从小到大的顺序
```dart
  /// deleteColumns(List<int> list)

  mat.deleteColumns([0, 2]);
  print( mat );

  // Matrix: 2x2
  // [2.0, 4.0]
  // [6.0, 8.0]
```
### 四则运算
#### 加法
```dart
  var mat = Matrix.fromList([
    [1, 2, 3],
    [4, 5, 6]
  ]);
  print( mat + 3 );
  print( mat + mat );

  // Matrix: 2x3
  // [4.0, 5.0, 6.0]
  // [7.0, 8.0, 9.0]

  // Matrix: 2x3
  // [2.0, 4.0, 6.0]
  // [8.0, 10.0, 12.0]
```
#### 减法
```dart
  var mat = Matrix.fromList([
    [1, 2, 3],
    [4, 5, 6]
  ]);
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
```
#### 数乘&乘法
```dart
  // 数乘(数字应在乘号右侧)
  var mat = Matrix.fromList([
    [1, 2, 3],
    [4, 5, 6]
  ]);
  print( mat * 3 );

  // Matrix: 2x3
  // [3.0, 6.0, 9.0]
  // [12.0, 15.0, 18.0]


  // 矩阵乘法
  var multi = Matrix.fromList([
    [2, 3.5],
    [1, -2],
    [-4, 0.5]
  ]);
  print( mat * multi );

  // Matrix: 2x2
  // [-8.0, 1.0]
  // [-11.0, 7.0]
```
### Matrix注意事项

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
向量是List< double >类型。如果您使用了List< int >或List< num >类型，在没有隐式类型转换的情况下，赋值将会失败。使用Matrices提供的所有构造方法均没有这种风险。但如果您先定义了List，然后将其赋值给一个Matrix的行或者列，可能会导致这种风险。示例如下：
```dart
  var vec = [6, 6, 6];
  Vector vec1 = [6, 6, 6];
  List<double> vec2 = [6, 6, 6];

  // 以下代码将无法运行
  // 将vec改为vec1或vec2后，可以运行
  // 因为vec是List<int>类型，而非List<double>
  var mat = Matrix.fromList([
    [1, 2, 3],
    [4, 5, 6],
    vec
  ]);
  print( mat );
```

****

## 方阵类SquareMatrix

### SquareMatrix类说明

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
SquareMatrix是Matrix类的子类，该类的对象可以使用矩阵类的所有属性和方法。同时，SquareMatrix类包含一些方阵特有的属性和方法，如快速创建一个方阵、求方阵的行列式的值、逆矩阵、特征值、特征向量等。

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
  print( mat );

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
### SquareMatrix查询
#### 行列式的值
```dart
  /// double determinant()

  var mat = SquareMatrix.fromList([
    [1, 2],
    [1, 1]
  ]);
  print( mat.determinant() );

  // -1.0
```
#### 逆矩阵
```dart
  /// SquareMatrix inverse()

  var mat = SquareMatrix.fromList([
    [1, 2],
    [1, 1]
  ]);
  print( mat.inverse() );

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
### SquareMatrix注意事项
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
特征值和特征向量当前版本暂未提供，敬请期待。

****

## 向量类型Vector

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
在Matrices中，向量即List< double >类型的数据。
### 向量类型说明

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Vector只是List< double >类型的别名。为了防止您创建的List类型变量不能作为向量使用，您也可以直接显示地创建向量类型的变量。同时，Matrice提供了一些常用的创建和操作向量类型的方法。

### 创建和操作向量
```dart
  /// 创建向量类型的变量
  Vector vec = [1, 2, 3];
  print( vec );    

  // [1.0, 2.0, 3.0]

  /// 获取向量的元素
  print( vec[1] );    // 2.0

  /// 修改向量元素的值
  vec[1] = 6;
  print( vec[1] );    // 6.0

```
### 快速创建特殊向量
```dart
  /// 创建全为某个数的向量
  /// Vector numberVector(int length, double seed)
  print( numberVector(4, 6) );

  // [6.0, 6.0, 6.0, 6.0]

  /// 创建全为随机数的向量
  /// Vector randomVector(int length)
  print( randomVector(2) );

  // [0.29616116997641384, 0.1199242872392301]

  /// 生成从start到end的步长为step的向量，默认步长为1
  /// Vector rangeVector(num start, num end, {num step = 1})
  print( rangeVector(2, 6, step: 2) );
  
  // [2.0, 4.0, 6.0]
```

### Vector注意事项

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Vector是List< double >类型的别名，因此可以使用List的所有属性和方法，也可以将Vector完全当作List来使用。在Matrices中，出于简化数据类型的目的，我们没有定制一个Vector类，而是借用了已有的数据类型。

****

## 赞助我们 ❤  
您可以点击&nbsp;[PayPal](https://paypal.me/abandoft)&nbsp;支付赞助我们

****