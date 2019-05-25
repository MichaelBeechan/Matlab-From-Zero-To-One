%% github��https://github.com/MichaelBeechan
%% CSDN��https://blog.csdn.net/u011344545
%% Time��2019.5.25
%% Function�����ú���  ��άͼ����άͼ

%% ���ú���
A = [1 3 5];
max(A)

B = [10 5 9]
max(A, B)

maxA = max(A)

[maxA,location] = max(A)

disp(A)

%% ��άͼ����άͼ
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

%% ��ά��ͼ
% ��άͼͨ����ʾһ���ɴ����������ĺ������� z = f (x,y)�����������ͼ
[X, Y] = meshgrid(-2:.2 : 2);
Z = X .* exp(-X.^2 - Y.^2);
figure(2)
surf(X, Y, Z)

%% ��ͼ subplot
t = 0 : pi / 10 : 2 * pi;
[X, Y, Z] = cylinder(4 * cos(t));
figure(3)
subplot(2, 2, 1); mesh(X); title('X');
subplot(2, 2, 2); mesh(Y); title('Y');
subplot(2, 2, 3); mesh(Z); title('Z');
subplot(2, 2, 4); mesh(X, Y, Z); title('X,Y,Z');


