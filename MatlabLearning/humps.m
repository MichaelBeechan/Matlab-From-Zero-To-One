%% github��https://github.com/MichaelBeechan
%% CSDN��https://blog.csdn.net/u011344545
%% Time��2019.6.8
function y = humps(x)
y = 1./((x-.3).^2 + .01) + 1./((x-.9).^2 + .04) - 6;