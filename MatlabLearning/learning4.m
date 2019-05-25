%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.5.25
%% Function：edit learning4

% Generate random data from a uniform distribution
% and calculate the mean. Plot the data and the mean.
n = 50;
r = rand(n, 1);
plot(r)

% Draw a line from (0,m) to (n,m)
m = mean(r);
hold on
plot([0, n], [m, m])
hold off
title('Mean of Random Uniform Data')

%% 使用 for 循环来计算 5 个随机样本的均值和总均值。
nsamples = 5;
npoints = 50;
%{
for k = 1 : nsamples
    currentData = rand(npoints, 1);
    sampleMean(k) = mean(currentData)
end
overallMean = mean(sampleMean)
%}
for k = 1:nsamples
   iterationString = ['Iteration #',int2str(k)];
   disp(iterationString)
   currentData = rand(npoints,1);
   sampleMean(k) = mean(currentData)
end
overallMean = mean(sampleMean)

if overallMean < .49
   disp('Mean is less than expected')
elseif overallMean > .51
   disp('Mean is greater than expected')
else
   disp('Mean is within the expected range')
end
