%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.6.8
%% Function：非线性函数的运算

%% 函数句柄
%% 功能函数

%% 函数句柄
% 在 MATLAB 中，使用 at 符号 @ 在函数名称前面构造函数句柄
fhandle = @sin;
% 您可以按照使用函数名称调用函数的相同方式，通过函数句柄来调用函数
% fhandle(arg1, arg2, ...);
%{
下面显示的函数 plot_fhandle 接收函数句柄和数据，使用函数句柄生成 y 轴数据，并对数据绘图：

function plot_fhandle(fhandle, data)
plot(data, fhandle(data))
当调用带有如下 sin 函数的句柄和参数的 plot_fhandle 时，得到的计算结果会生成正弦波图：

plot_fhandle(@sin, -pi:0.01:pi)
%}

%% 功能函数
%{ 
名为“接受函数句柄的函数”的函数类与标量变量的非线性函数配合使用。
也就是说，某个函数基于另一个函数运行。接受函数句柄的函数包括
找零
优化
正交
常微分方程
%}
x = 0:.002:1;
y = humps(x);
plot(x,y)

% 函数 fminsearch 会求最小值
p = fminsearch(@humps,.5) 
humps(p)

% 数值分析采用术语正交和积分来区别定积分的近似数值和常微分方程的数值积分
Q = quadl(@humps,0,1)
z = fzero(@humps,.5)










