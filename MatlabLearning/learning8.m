%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.5.27
%% Function：线性代数

%% 创建矩阵
% 三角形对称矩阵
A = pascal(3)

B = magic(3)

% randi 的第一个输入描述整数可能值的范围，后面两个输入描述行和列的数量
C = randi(10,3,2) 
% ";" 列 ",或者空格" 行
%% 矩阵的加法和减法
X = A + B

Y = X - A

%% 向量乘积和转置
u = [3; 1; 4];
v = [2 0 -1];
x1 = v * u
x2 = u * v
% 对于实矩阵，转置运算对 aij 和 aji 进行交换
% 对于复矩阵，还要考虑是否用数组中复数项的复共轭来形成复共轭转置
% MATLAB 使用撇号运算符 (') 执行复共轭转置
% 使用点撇号运算符 (.') 执行无共轭的转置

X = B'
A
B
% 点积
C = dot(A,B)
C = dot(A,B,3)

z = [1+2i 7-3i 3+4i; 6-2i 9i 4+7i]
z'  % 共轭
z.' % 实数转置

%% 矩阵乘法
A = pascal(3);
B = magic(3);
m = 3;
n = 3;
for i = 1 : m
    for j = 1 : n
        C(i, j) = A(i,:) * B(:,j);
    end
end
C
X1 = A * B
X2 = B * A
 
%% 单位矩阵
% eye(m, n)

%% 矩阵求逆
% A为非奇异方阵（非零行列式） AX = I 和 XA = I 具有相同的解X
% X称为A的逆矩阵即A(-1)  inv

A = pascal(3)
pascal(3, 0)
pascal(3, 1)
pascal(3, 2)

% 由帕斯卡三角形构成的具有整数项的对称正定矩阵。
X = inv(A)
A * X
%round(A * X)
%round(A * X) %  四舍五入
%ceil(A * X)  %  向上取整
%floor(A * X) %  向下取整

d = det(A)   % 计算行列式

% 有些矩阵接近奇异矩阵，虽然存在逆矩阵，但计算容易出现数值误差。
% cond 函数计算逆运算的条件数，它指示矩阵求逆结果的精度
% 条件数的范围是从 1（数值稳定的矩阵）到 Inf（奇异矩阵）
c = cond(A)
% 很少需要为某个矩阵构造显式逆矩阵。
% 求解线性方程组 Ax = b 时，常常会误用 inv。
% 从执行时间和数值精度方面而言，求解此方程的最佳方法是使用矩阵反斜杠运算符，即 x = A\b。

%% Kronecker 张量积
%{
两个矩阵的 Kronecker 乘积 kron(X,Y) 为 X 的元素与 Y 的元素的所有可能乘积构成的较大矩阵
如果 X 为 m×n 且 Y 为 p×q，则 kron(X,Y) 为 mp×nq。
[X(1,1)*Y  X(1,2)*Y  . . .  X(1,n)*Y
                     . . .
 X(m,1)*Y  X(m,2)*Y  . . .  X(m,n)*Y]
%}
x = [1 2 
    3 4];
I = eye(2,2);
kron(x, I)
%{
     1     0     2     0
     0     1     0     2
     3     0     4     0
     0     3     0     4
%}
kron(I, x)
%{
     1     2     0     0
     3     4     0     0
     0     0     1     2
     0     0     3     4
%}
% 除了 kron 之外，对复制数组有用的其他函数还有 repmat、repelem 和 blkdiag。

%% 向量范数和矩阵范数
% 向量 x 的 p-范数    norm(x, p)
% 最常见的 p 值为 1、2 和 ∞ 默认为2
v = [2 0 -1];
[norm(v, 1) norm(v, 2) norm(v, inf) norm(v)]

% 矩阵 A 的 p-范数    SUM(ABS(V).^P)^(1/P)
% 最常见的 p 值为 1、2 和 ∞ 默认为2
A = pascal(3);
[norm(A,1) norm(A) norm(A,inf)]

% 如果要计算矩阵的每行或每列的范数，可以使用 vecnorm：
vecnorm(A)    % sum(abs(v).^p)^(1/p)

%% 使用线性代数方程函数的多线程计算
%% 线性方程组
% 给定两个矩阵 A 和 b，是否存在一个唯一矩阵 x 使 Ax = b 或 xA = b？
% 斜杠 / 和反斜杠 \ 这两个除号分别对应 MATLAB 函数 mrdivide 和 mldivide
% mldivide  https://ww2.mathworks.cn/help/matlab/ref/mldivide.html
%  Ax = b  =>  x = A \ b  或  xA = b  =>  x = b / A
% (b/A)' = (A'\b').
%{
如果 A 的大小为 m×n
m = n   方阵方程组。求精确解。
m > n   超定方程组，即方程个数多于未知数个数。求最小二乘解。
m < n   欠定方程组，即方程个数少于未知数个数。使用最多 m 个非零分量求基本解。
%}

%% 通解
%{
1、求对应的齐次方程组 Ax = 0 的解。使用 null 命令通过键入 null(A) 来执行此操作。
这会将解空间的基向量恢复为 Ax = 0。任何解都是基向量的线性组合。
2、求非齐次方程组 Ax = b 的特定解。
3、然后，可将 Ax = b 的任何解写成第 2 步中的 Ax = b 的特定解加上第 1 步中的基向量的线性组合之和。
%}
%% 方阵方程组
%% 非奇异系数矩阵
% 如果矩阵 A 是非奇异矩阵，则解 x = A\b 的大小与 b 的大小相同
A = pascal(3);
inv(A);
u = [3; 1; 4];
x = A \ u

% 如果 A 和 b 为方阵并且大小相同，则 x= A\b 也具有相同大小
b = magic(3)
X = A \ b

%% 奇异系数矩阵
P = pinv(A)*b   % pinv(A) 是 A 的伪逆
% 如果 Ax = b 没有精确解，则 pinv(A) 将返回最小二乘解
A = [ 1     3     7
     -1     4     4
      1    10    18 ];
rank(A)

% 精确解
% 对于 b =[5;2;12]，方程 Ax = b 具有精确解
b =[5;2;12];
pinv(A) * b
% 验证 pinv(A)*b 是否为精确解
A * pinv(A) * b

% 最小二乘解 
% 如果 b = [3;6;0]，则 Ax = b 没有精确解。
% 在这种情况下，pinv(A)*b 会返回最小二乘解
b = [3;6;0];
A * pinv(A) * b



  












