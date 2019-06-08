%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.6.2
%% Function：分解 幂和指数

%% Cholesky 分解
%% LU 分解
%% QR 分解
%% 对分解使用多线程计算

%% Cholesky 分解   ===>  正定矩阵
% Cholesky 分解将对称矩阵表示为三角矩阵与其转置的积
% A = R′R    R 是上三角矩阵     
% A 的所有对角线元素都是正数，并且非对角线元素“不太大”
A = pascal(6)
R = chol(A)
R' * R

%{
Cholesky 分解也适用于复矩阵。采用 Cholesky 分解的任何复矩阵都满足
A′ = A，并且被视为 Hermitian 正定矩阵。
%}
% Ax = b    ===>    R'Rx = b    ===>  x = R \ (R'\b)
% 如果 A 为 n×n，则 chol(A) 的计算复杂度为 O(n^3)，但后续的反斜杠解的复杂度仅为 O(n^2)

%% LU 分解   下三角矩阵和上三角矩阵的置换之积
% A = LU    A*x = b   ===>   x = U \ (L \ b)
B = pascal(3)
[L, U] = lu(B)
% det(B) = det(L)*det(U) 与 det(B) = prod(diag(U)) 符号相反
% inv(B) = inv(U)*inv(L)
% det(B) = prod(diag(U))

%% QR 分解
% 正交矩阵 ===> 实矩阵   如果 Q 为正交矩阵 Q′Q = 1
%{
[cos(θ)  ?sin(θ)
sin(θ)   cos(θ)]
%}
%   A = QR
%   AP = QR
% 其中，Q 为正交或单位矩阵，R 为上三角矩阵，P 为置换向量。
C = gallery('uniformdata', [5 4], 0);
[Q, R] = qr(C)
% 在许多情况下，Q 的最后 m – n 列是不需要的，因为这些列会与 R 底部的零相乘。
% 精简
[Q, R] = qr(C, 0)

[Q, R, P] = qr(C)

[Q, R, p] = qr(C, 0)
%{ 
QR 分解可将超定线性方程组转换为等效的三角形方程组。表达式
norm(A*x - b) 等于 norm(Q*R*x - b)
与正交矩阵相乘可保留欧几里德范数，因此该表达式也等于
norm(R*x - y)
其中 y = Q'*b。由于 R 的最后 m-n 行为零，因此该表达式将分为两部分：
norm(R(1:n,1:n)*x - y(1:n))  并且  norm(y(n+1:m))
%}

%% 幂和指数
% 正整数幂
% 如果 A 为方阵并且 p 为正整数，则 A^p 可有效地将 A 乘以其自身 p-1 次。
A = [1 1 1;1 2 3;1 3 6]
X = A^2

% 逆幂和分数幂
% 如果A为方阵并且是非奇异的，则A^(-p)可有效地将inv(A)乘以其自身p-1次：
Y = A^(-3)

Y = inv(A)^3
% 还允许使用 A^(2/3) 等分数幂；结果取决于矩阵的特征值的分布

% 逐元素幂  ".^"
X = A.^2

% 指数
% 函数 sqrtm(A) 采用更精确的算法计算 A^(1/2)
% sqrtm 中的 m 将此函数与 sqrt(A) 区分开来，后者与 A.^(1/2) 一样，以逐元素方式工作
% 线性、常系数、常微分方程组可写成：
% dx / dt = Ax  其中，x = x(t) ===>  x(t) = e^(tA)x(0)
% 函数 expm(A) 计算矩阵指数
A = [0 -6 -1; 6 2 -16; -5 20 -10]
x0 = [1 1 1]'
% 矩阵指数用于计算微分方程在区间0 <= t <= 1上的101个点处的解x(t)
X = [];
for t = 0 : 0.01 : 1
    X = [X expm(t * A)*x0]; 
end
X
plot3(X(1,:),X(2,:),X(3,:),'-o')










































