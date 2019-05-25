%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.5.24
%% Function：数组索引 工作区变量 文本和字符

%% 数组索引
A = magic(4)
%{
A =
    16     2     3    13
     5    11    10     8
     9     7     6    12
     4    14    15     1
%}

A(4, 2)  %A(8)

%% 如果尝试在赋值语句右侧引用数组外部元素，MATLAB 会引发错误。
%test = A(4, 5)

A(4, 5) = 17
%{
A =
    16     2     3    13     0
     5    11    10     8     0
     9     7     6    12     0
     4    14    15     1    17
%}

%% 冒号运算符
A(1:3,2)
A(3,:)

B = 0:10:100

%% 工作区变量
A = magic(4);
B = rand(3, 5, 2);
% whos

save myfile.mat
% load myfile.mat

%% 文本和字符  "'"转置
myText = 'Hello, world';
otherText = 'You''re right'

whos myText otherText

longText = [myText, otherText]
longText = [myText, ' ', otherText]

%% 要将数值转换为字符，请使用 num2str 或 int2str 等函数
f = 71;
c = (f - 32) / 1.8; % \circ
tempText = ['Temperature is ', num2str(c), 'C']







