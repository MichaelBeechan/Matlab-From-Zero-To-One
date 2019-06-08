%% github��https://github.com/MichaelBeechan
%% CSDN��https://blog.csdn.net/u011344545
%% Time��2019.6.8
%% Function�������Ժ���������

%% �������
%% ���ܺ���

%% �������
% �� MATLAB �У�ʹ�� at ���� @ �ں�������ǰ�湹�캯�����
fhandle = @sin;
% �����԰���ʹ�ú������Ƶ��ú�������ͬ��ʽ��ͨ��������������ú���
% fhandle(arg1, arg2, ...);
%{
������ʾ�ĺ��� plot_fhandle ���պ�����������ݣ�ʹ�ú���������� y �����ݣ��������ݻ�ͼ��

function plot_fhandle(fhandle, data)
plot(data, fhandle(data))
�����ô������� sin �����ľ���Ͳ����� plot_fhandle ʱ���õ��ļ��������������Ҳ�ͼ��

plot_fhandle(@sin, -pi:0.01:pi)
%}

%% ���ܺ���
%{ 
��Ϊ�����ܺ�������ĺ������ĺ���������������ķ����Ժ������ʹ�á�
Ҳ����˵��ĳ������������һ���������С����ܺ�������ĺ�������
����
�Ż�
����
��΢�ַ���
%}
x = 0:.002:1;
y = humps(x);
plot(x,y)

% ���� fminsearch ������Сֵ
p = fminsearch(@humps,.5) 
humps(p)

% ��ֵ�����������������ͻ��������𶨻��ֵĽ�����ֵ�ͳ�΢�ַ��̵���ֵ����
Q = quadl(@humps,0,1)
z = fzero(@humps,.5)










