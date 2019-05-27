%% github£ºhttps://github.com/MichaelBeechan
%% CSDN£ºhttps://blog.csdn.net/u011344545
%% Time£º2019.5.27
%% Function£ºaverage value
function avg = avgscore(testscores, student, first, last)
testscores.Ann_Lane.week(1:25) = ...
  [95 89 76 82 79 92 94 92 89 81 75 93 ...
   85 84 83 86 85 90 82 82 84 79 96 88 98];

testscores.William_King.week(1:25) = ...
  [87 80 91 84 99 87 93 87 97 87 82 89 ...
   86 82 90 98 75 79 92 84 90 93 84 78 81];
for k = first : last
    scores(k) = testscores.(student).week(k);
end
avg = sum(scores)/(last - first + 1);
end