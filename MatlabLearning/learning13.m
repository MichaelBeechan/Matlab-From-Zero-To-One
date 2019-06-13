%% github��https://github.com/MichaelBeechan
%% CSDN��https://blog.csdn.net/u011344545
%% Time��2019.6.8
%% Function����������� ���ݷ���

%% ���������
% MATLAB? �Զ����ͳ������ʹ���������
% ��(i,j)��Ԫ���ǵ�j�������ĵ�i���۲�ֵ��
%{
���磬����һ�������������������ݼ���
����
����
ÿ�ܶ���Сʱ��
%}
D = [72          134          3.2
     81          201          3.5
     69          156          7.1
     82          148          2.4
     75          170          1.2 ];
mu = mean(D)
sigma = std(D)
 
% �й� MATLAB ���ṩ�����ݷ����������б�
help datafun 
% Statistics and Machine Learning Toolbox
help stats

%% ���ݷ���
% Ԥ������>���ܡ���>���ӻ�����>��ģ
%{
Ԥ���� - ������Ⱥֵ�Լ�ȱʧֵ���������ݽ���ƽ�������Ա�ȷ�����ܵ�ģ�͡�
���� - ���������ͳ����Ϣ���������ݵ�����λ�á���ģ����״��
���ӻ� - ���������Ա�ȷ��ģʽ�����ơ�
��ģ - ��ȫ��������������ƣ��Ա�Ԥ��������ֵ��
Ŀ�ģ�
ʹ�ü�ģ�������������е�ģʽ���Ա�ʵ����ȷԤ�⡣
�˽����֮��Ĺ�ϵ���Ա㹹��ģ�͡�
%}

% ��������
load count.dat  % 24��3����count��������ʮ��·�ڣ��У���һ���е�ÿСʱ����ͳ�ƣ��У�

% ȱʧ����   NaN�������֣�ֵͨ�����ڱ�ʾȱʧ����
% ʹ�� isnan ������������ʮ��·�ڵ������Ƿ���� NaN ֵ
c3 = count(:, 3);  %Data at intersection 3
c3NaNCount = sum(isnan(c3))

% ��Ⱥֵ
% ��Ⱥֵ�������������е�ģʽ���Բ�ͬ������ֵ
% ȷ����Ⱥֵ��һ�ֳ��÷����ǲ������ֵ�ı�׼�����ĳ�����ֵ�ֵ
h = histogram(c3, 10);
N = max(h.Values);
mu3 = mean(c3);
sigma3 = std(c3);

hold on
plot([mu3 mu3], [0 N], 'r', 'LineWidth', 2)
X = repmat(mu3 + (1 : 2) * sigma3, 2, 1);
Y = repmat([0; N], 1, 2);
plot(X, Y, 'Color', [255 153 51]./255, 'LineWidth', 2)
legend('Data', 'Mean', 'Stds')
hold off

outliers = (c3 - mu3) > 2*sigma3;
c3m = c3; % Copy c3 to c3m
c3m(outliers) = NaN; % Add NaN values

% ƽ����ɸѡ














