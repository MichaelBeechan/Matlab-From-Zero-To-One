%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.6.16
%% Function：傅里叶

% 傅里叶变换是将按时间或空间采样的信号与按频率采样的相同信号进行关联的数学公式
% 以正弦信号 x 为例，该信号是时间 t 的函数，频率分量为 15 Hz 和 20 Hz。
% 使用在 10 秒周期内以1/50秒为增量进行采样的时间向量。
t = 0 : 1/50 : 10 - 1/50;                     
x = sin(2 * pi * 15 * t) + sin(2 * pi * 20 * t);
plot(t, x)

% 计算信号的傅里叶变换，并在频率空间创建对应于信号采样的向量 f
y = fft(x);
f = (0 : length(y) - 1) * 50 / length(y);

plot(f, abs(y))
title('Magnitude')

% 该变换还会生成尖峰的镜像副本，该副本对应于信号的负频率。
% 为了更好地以可视化方式呈现周期性，您可以使用fftshift函数对变换执行以零为中心的循环平移。
n = length(x);
fshift = (- n/2 : n/2 - 1) * (50/n);
yshift = fftshift(y);
plot(fshift, abs(yshift))

%% 噪声信号
% 在科学应用中，信号经常遭到随机噪声破坏，掩盖其频率分量
% 傅里叶变换可以清除随机噪声并显现频率
% 通过在原始信号 x 中注入高斯噪声，创建一个新信号 xnoise
xnoise = x + 2.5 * gallery('normaldata', size(t), 4);
ynoise = fft(xnoise);
ynoiseshift = fftshift(ynoise);
power = abs(ynoiseshift).^2/n;
plot(fshift, power)
title('Power')

%% 计算效率
whaleFile = 'bluewhale.au';
[x, fs] = audioread(whaleFile);
whaleMoan = x(2.45e4 : 3.10e4);
t = 10 * (0 : 1/fs : (length(whaleMoan) - 1) / fs);

plot(t, whaleMoan)
xlabel('Time(seconds)')
ylabel('Amplitude')
xlim([0 t(end)])   % x轴的上下限设定

% 指定新的信号长度，该长度是大于原始长度的最邻近的 2 的幂。
% 然后使用 fft 和新的信号长度计算傅里叶变换。fft 会自动用零填充数据，以增加样本大小。
% 此填充操作可以大幅提高变换计算的速度，对于具有较大质因数的样本大小更是如此。
m = length(whaleMoan);
n = pow2(nextpow2(m));
y = fft(whaleMoan, n);
% 绘制信号的功率频谱
f = (0 : n-1) * (fs / n) / 10; % frequency vector
power = abs(y).^2 / n;   % power spectrum      
plot(f(1 : floor(n / 2)), power(1 : floor(n / 2)))
xlabel('Frequency')
ylabel('Power')
