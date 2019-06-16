%% github��https://github.com/MichaelBeechan
%% CSDN��https://blog.csdn.net/u011344545
%% Time��2019.6.16
%% Function������Ҷ

% ����Ҷ�任�ǽ���ʱ���ռ�������ź��밴Ƶ�ʲ�������ͬ�źŽ��й�������ѧ��ʽ
% �������ź� x Ϊ�������ź���ʱ�� t �ĺ�����Ƶ�ʷ���Ϊ 15 Hz �� 20 Hz��
% ʹ���� 10 ����������1/50��Ϊ�������в�����ʱ��������
t = 0 : 1/50 : 10 - 1/50;                     
x = sin(2 * pi * 15 * t) + sin(2 * pi * 20 * t);
plot(t, x)

% �����źŵĸ���Ҷ�任������Ƶ�ʿռ䴴����Ӧ���źŲ��������� f
y = fft(x);
f = (0 : length(y) - 1) * 50 / length(y);

plot(f, abs(y))
title('Magnitude')

% �ñ任�������ɼ��ľ��񸱱����ø�����Ӧ���źŵĸ�Ƶ�ʡ�
% Ϊ�˸��õ��Կ��ӻ���ʽ���������ԣ�������ʹ��fftshift�����Ա任ִ������Ϊ���ĵ�ѭ��ƽ�ơ�
n = length(x);
fshift = (- n/2 : n/2 - 1) * (50/n);
yshift = fftshift(y);
plot(fshift, abs(yshift))

%% �����ź�
% �ڿ�ѧӦ���У��źž����⵽��������ƻ����ڸ���Ƶ�ʷ���
% ����Ҷ�任��������������������Ƶ��
% ͨ����ԭʼ�ź� x ��ע���˹����������һ�����ź� xnoise
xnoise = x + 2.5 * gallery('normaldata', size(t), 4);
ynoise = fft(xnoise);
ynoiseshift = fftshift(ynoise);
power = abs(ynoiseshift).^2/n;
plot(fshift, power)
title('Power')

%% ����Ч��
whaleFile = 'bluewhale.au';
[x, fs] = audioread(whaleFile);
whaleMoan = x(2.45e4 : 3.10e4);
t = 10 * (0 : 1/fs : (length(whaleMoan) - 1) / fs);

plot(t, whaleMoan)
xlabel('Time(seconds)')
ylabel('Amplitude')
xlim([0 t(end)])   % x����������趨

% ָ���µ��źų��ȣ��ó����Ǵ���ԭʼ���ȵ����ڽ��� 2 ���ݡ�
% Ȼ��ʹ�� fft ���µ��źų��ȼ��㸵��Ҷ�任��fft ���Զ�����������ݣ�������������С��
% �����������Դ����߱任������ٶȣ����ھ��нϴ���������������С������ˡ�
m = length(whaleMoan);
n = pow2(nextpow2(m));
y = fft(whaleMoan, n);
% �����źŵĹ���Ƶ��
f = (0 : n-1) * (fs / n) / 10; % frequency vector
power = abs(y).^2 / n;   % power spectrum      
plot(f(1 : floor(n / 2)), power(1 : floor(n / 2)))
xlabel('Frequency')
ylabel('Power')
