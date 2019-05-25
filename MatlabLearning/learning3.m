%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.5.25
%% Function：调用函数  二维图和三维图

%% 调用函数
A = [1 3 5];
max(A)

B = [10 5 9]
max(A, B)

maxA = max(A)

[maxA,location] = max(A)

disp(A)

%% 二维图和三维图
%% plot
x = 0 : pi / 100 : 2 * pi;
y = sin(x);
figure(1)
plot(x, y)

xlabel('x')
ylabel('sin(x)')
title('Plot of the Sin function')

plot(x, y, 'r--')

hold on 

y2 = cos(x);
plot(x, y2, ':')
legend('sin', 'cos')

hold off

%% 三维绘图
% 三维图通常显示一个由带两个变量的函数（即 z = f (x,y)）定义的曲面图
[X, Y] = meshgrid(-2:.2 : 2);
Z = X .* exp(-X.^2 - Y.^2);
figure(2)
surf(X, Y, Z)

%% 子图 subplot
t = 0 : pi / 10 : 2 * pi;
[X, Y, Z] = cylinder(4 * cos(t));
figure(3)
subplot(2, 2, 1); mesh(X); title('X');
subplot(2, 2, 2); mesh(Y); title('Y');
subplot(2, 2, 3); mesh(Z); title('Z');
subplot(2, 2, 4); mesh(X, Y, Z); title('X,Y,Z');


