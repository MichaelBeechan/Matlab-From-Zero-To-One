%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.6.8
%% Function：多变量数据 数据分析

%% 多变量数据
% MATLAB? 对多变量统计数据使用列向分析
% 第(i,j)个元素是第j个变量的第i个观测值。
%{
例如，设想一个具有三个变量的数据集：
心率
体重
每周锻炼小时数
%}
D = [72          134          3.2
     81          201          3.5
     69          156          7.1
     82          148          2.4
     75          170          1.2 ];
mu = mean(D)
sigma = std(D)
 
% 有关 MATLAB 中提供的数据分析函数的列表
help datafun 
% Statistics and Machine Learning Toolbox
help stats

%% 数据分析
% 预处理——>汇总——>可视化——>建模
%{
预处理 - 考虑离群值以及缺失值，并对数据进行平滑处理以便确定可能的模型。
汇总 - 计算基本的统计信息以描述数据的总体位置、规模及形状。
可视化 - 绘制数据以便确定模式和趋势。
建模 - 更全面地描述数据趋势，以便预测新数据值。
目的：
使用简单模型来描述数据中的模式，以便实现正确预测。
了解变量之间的关系，以便构建模型。
%}

% 加载数据
load count.dat  % 24×3数组count包含三个十字路口（列）在一天中的每小时流量统计（行）

% 缺失数据   NaN（非数字）值通常用于表示缺失数据
% 使用 isnan 函数检查第三个十字路口的数据是否存在 NaN 值
c3 = count(:, 3);  %Data at intersection 3
c3NaNCount = sum(isnan(c3))

% 离群值
% 离群值是与其余数据中的模式明显不同的数据值
% 确定离群值的一种常用方法是查找与均值的标准差大于某个数字的值
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

% 平滑和筛选














