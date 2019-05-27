%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.5.26
%% Function：数组类型 元胞数组 字符与文本 动态字段名称

%% 多维数组
R = randn(3,4,5);
% 生成 4! = 24 置换1:4。第 k 个置换为行向量 p(k,:)
p = perms(1:4);    % 排列组合

A = magic(4);
M = zeros(4, 4, 24);

for k = 1 : 24
    M(:, :, k) = A(:, p(k, :));
end

size(M);

% 通过改变第 d 个下标来计算总和
%sum(M, d)
S1 = sum(M, 1);  %1×4×24 
S2 = sum(M, 2);  %4×1×24
S3 = sum(M, 3);  %4×4×1

M = ones(2, 2, 4)

S4 = sum(M, 3)

%% 元胞数组
% MATLAB 中的元胞数组是以其他数组的副本为元素的多维数组
% 使用 cell 函数可以创建空矩阵的元胞数组
% 更普遍的做法是，通过将其他内容的集合括入花括号 {} 中来创建元胞数组
prod(A)   % 是向量A的元素的乘积
C = {A sum(A) prod(prod(A))}

% 要检索某个元胞的内容，请在花括号中使用下标
C{1}
% 元胞数组包含其他数组的副本，而不包含指向这些数组的指针，即如果随后更改 A，C 不会发生变化
M = cell(8, 1);
for n = 1 : 8
    M{n} = magic(n);
end
M

%% 字符与文本
s = 'hello'
% 字符在内部作为数字存储，而不会采用浮点格式存储
a = double(s)   % 104   101   108   108   111
s = char(a)     % 'hello'

F = reshape(32:127,16,6)'
% 扩展 ASCII 字符集中的可打印字符由 F+128 表示。
char(F)
char(F+128)

h = [s, ' world']  % v = [s; 'world']  %  v 中的两个单词的长度必须相同

% 操作包含不同长度的行的文本主体
% 使用填充的字符数组或使用字符向量元胞数组 char
S = char('A','rolling','stone','gathers','momentum.')
C = {'A';'rolling';'stone';'gathers';'momentum.'}
% S = char(C)
% 将填充后的字符数组转换为字符向量元胞数组
C = cellstr(S)
% 逆过程
S = char(C)


