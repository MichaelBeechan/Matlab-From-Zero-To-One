%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.5.27
%% Function：动态字段名称 结构体

%% 结构体
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

% 创建字符数组
names = char(S.name)
% 创建元胞数组
names = {S.name}
% 将结构体数组的每个元素的字段赋值给结构体外部的单独变量
[N1 N2 N3] = S.name

%% 动态字段名称
% 访问结构体中的数据的最常用方法是指定要引用的字段的名称
% 访问结构体数据的另一种方法是使用动态字段名称
% 此处显示的点-括号语法将 expression 作为动态字段名称
% structName.(expression)
% structName.(expression)(7,1:25)

avgscore(testscores, 'Ann_Lane', 7, 22)
avgscore(testscores, 'William_King', 7, 22)