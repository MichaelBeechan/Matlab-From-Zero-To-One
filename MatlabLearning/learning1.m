%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.5.24
%% Function：变量、数组、矩阵、矩阵运算、复数

%% 变量定义
a = 1;
b = 1;

c = a + b

%% 数组创建
a = [1 2 3 4]

%% 矩阵
a = [1 2 3; 4 5 6; 7 8 10]

%% ones, zeros, rand等函数创建
a1 = zeros(5, 5)
b1 = ones(5, 5)
c1 = rand(5, 5)

%% 矩阵数组运算
a + 10

sin(a)

%% 转置
a'

%% 逆
inv(a)  % a^(-1)

%% 矩阵乘以其逆矩阵可返回单位矩阵
p1 = a * inv(a)   % 请注意，p1 不是整数值矩阵

%% format 命令可以显示更多小数位数
% format long
% format short

%% 点乘运算法 .* 执行元素级乘法
p2 = a .* a
p3 = a * a  % 矩阵乘法
%{
p2 =
     1     4     9
    16    25    36
    49    64   100
p3 =
    30    36    45
    66    81   102
   109   134   169
%}

%% 串联 (‘,’水平串联  ‘;’垂直串联)
A = [a a]
A = [a, a]
A = [a; a]

%% 复数  复数的虚部可用i或者j表示
sqrt(-1)  % 0.0000 + 1.0000i

c = [3 + 4i, 4 + 3j; -i, 10j]










