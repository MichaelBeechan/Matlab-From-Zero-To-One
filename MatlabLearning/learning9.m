%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.6.2
%% Function：线性方程组

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

%% 增广矩阵
% 通过得到增广矩阵 [A b] 的简化行阶梯形式，可以确定 Ax = b 是否具有精确解
rref([A b])

%% 超定方程组
t = [0 .3 .8 1.1 1.6 2.3]';
y = [.82 .72 .63 .60 .55 .50]';
B = table(t, y)

% 指数衰减函数
E = [ones(size(t)) exp(-t)]

% 使用反斜杠运算符获取最小二乘解
c = E\y

T = (0 : 0.1 : 2.5)';
Y = [ones(size(T)) exp(-T)] * c;
plot(T, Y, '-', t, y, 'o')

%% 欠定方程组
R = [6 8 7 3; 3 5 4 1];
rng(0);
b = randi(8, 2, 1)
format rat
p = R \ b

Z = null(R, 'r')

R * Z

% 残差
q = [-2; 1];
x = p + Z*q

% 计算残差的范数
format short
norm(R*x - b)

% 如果有无限多个解，则最小范数解具有特别意义。
% 可以使用 lsqminnorm 计算最小范数最小二乘解。
% 该解具有 norm(p) 的最小可能值。
p = lsqminnorm(R,b)

%% 多右端线性方程组的求解
% LU、LDL、Cholesky 等
% [L,U] = lu(A);
% x = U \ (L \ b);
% 对于具有若干连续右端的线性方程组，建议使用 decomposition 对象求解

% dA = decomposition(A, 'lu');
% x = dA \ b;

% 反斜杠 (\) 和 decomposition 性能测试
n = 1e3;
A = sprand(n, n, 0.2) + speye(n);
b = ones(n, 1);

% 反斜杠“\”
tic
for k = 1 : 100
    x = A \ b;
end
x
toc

% decomposition
tic
dA = decomposition(A);
for k = 1 : 100
    x = dA \ b;
end
x
toc

%% 迭代法
% 如果系数矩阵 A 很大并且是稀疏矩阵，分解方法一般情况下将不会有效。
% 迭代方法可生成一系列近似解。
%{
函数	      说明
pcg	        预处理共轭梯度法。此方法适用于 Hermitian 正定系数矩阵 A。
bicg	    双共轭梯度法
bicgstab	双共轭梯度稳定法
bicgstabl	双共轭梯度稳定法(l)
cgs	        共轭梯度二乘法
gmres	    广义最小残差法
lsqr	    LSQR 方法
minres	    最小残差法。此方法适用于 Hermitian 系数矩阵 A。
qmr	        拟最小残差法
symmlq	    对称的 LQ 方法
tfqmr	    无转置 QMR 方法
%}

%% 多线程计算
% 如果启用多线程 inv、lscov、linsolve 和 mldivide 
% 将会对大型双精度数组（约 10,000 个元素或更多）大幅增加速度















