%% github��https://github.com/MichaelBeechan
%% CSDN��https://blog.csdn.net/u011344545
%% Time��2019.5.27
%% Function����̬�ֶ����� �ṹ��

%% �ṹ��
S = struct('name', 'Ed Plum','score', 83, 'grade','B+')
S(2).name = 'Toni Miller';
S(2).score = 91;
S(2).grade = 'A-';
S(3) = struct('name','Jerry Garcia',... 
               'score',70,'grade','C')
%S.name
%S.score
%S(1).score, S(2).score, S(3).score
%S.grade

scores = [S.score]
avg_score = sum(scores) / length(scores)

% �����ַ�����
names = char(S.name)
% ����Ԫ������
names = {S.name}
% ���ṹ�������ÿ��Ԫ�ص��ֶθ�ֵ���ṹ���ⲿ�ĵ�������
[N1 N2 N3] = S.name

%% ��̬�ֶ�����
% ���ʽṹ���е����ݵ���÷�����ָ��Ҫ���õ��ֶε�����
% ���ʽṹ�����ݵ���һ�ַ�����ʹ�ö�̬�ֶ�����
% �˴���ʾ�ĵ�-�����﷨�� expression ��Ϊ��̬�ֶ�����
% structName.(expression)
% structName.(expression)(7,1:25)

avgscore(testscores, 'Ann_Lane', 7, 22)
avgscore(testscores, 'William_King', 7, 22)