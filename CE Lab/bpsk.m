%BPSK
clc; clear all; close all;
x = randi([0, 1], 1, 10);
Eb=1; Tb=0.1; fc=10; fs=1000;
samplebit = fs * Tb;
time = length(x) * Tb;
t = 0:1/fs:time-1/fs;
s1 = sqrt(2*Eb/Tb)*cos(2*pi*fc.*t);     
s2 = sqrt(2*Eb/Tb)*cos(2*pi*fc.*t + pi);
y = zeros(size(t));
for i = 1:length(x)
    start = (i-1)*samplebit + 1;
    finish = i*samplebit;
    if x(i) == 1
        y(start:finish) = s1(start:finish);
    else
        y(start:finish) = s2(start:finish);
    end
end

subplot(311);
stairs(0:Tb:time-Tb, x); title('Binary Sequence'); xlim([0 1]); ylim([-0.5 1.5])
subplot(312);
plot(t,y);title('BPSK Modulated Signal');
subplot(313);
Y=fftshift(abs(fft(y)));
plot(Y); title("Spectrum");