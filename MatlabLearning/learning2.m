%% github��https://github.com/MichaelBeechan
%% CSDN��https://blog.csdn.net/u011344545
%% Time��2019.5.24
%% Function���������� ���������� �ı����ַ�

%% ��������
A = magic(4)
%{
A =
    16     2     3    13
     5    11    10     8
     9     7     6    12
     4    14    15     1
%}

A(4, 2)  %A(8)

%% ��������ڸ�ֵ����Ҳ����������ⲿԪ�أ�MATLAB ����������
%test = A(4, 5)

A(4, 5) = 17
%{
A =
    16     2     3    13     0
     5    11    10     8     0
     9     7     6    12     0
     4    14    15     1    17
%}

%% ð�������
A(1:3,2)
A(3,:)

B = 0:10:100

%% ����������
A = magic(4);
B = rand(3, 5, 2);
% whos

save myfile.mat
% load myfile.mat

%% �ı����ַ�  "'"ת��
myText = 'Hello, world';
otherText = 'You''re right'

whos myText otherText

longText = [myText, otherText]
longText = [myText, ' ', otherText]

%% Ҫ����ֵת��Ϊ�ַ�����ʹ�� num2str �� int2str �Ⱥ���
f = 71;
c = (f - 32) / 1.8; % \circ
tempText = ['Temperature is ', num2str(c), 'C']







