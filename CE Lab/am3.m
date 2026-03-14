clc; clear all; close all;
fm = 50;
t=0:.0001:.25 ;
fs = 1 / (t(2) - t(1));
x=sin(2*pi*fm*t);
fc =  100;
y=sin(2*pi*fc*t);

% AM signal 
AM = (1 + x) .* y;

% Demodulation 
[b, a] = butter(6, fm/(fs/2));
msg_am = filtfilt(b, a, abs(AM));

subplot(2, 1, 1);
plot(t, x);
title('Original Message Signal'); xlabel('Time'); ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, msg_am);
title('Demodulated AM (m=1)'); xlabel('Time'); ylabel('Amplitude');
