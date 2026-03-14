clc; clear all; close all;
fm = 50;
t=0:.0001:.25 ;
fs = 1 / (t(2) - t(1));
x=sin(2*pi*fm*t);
fc =  100;
y=sin(2*pi*fc*t);

f=-1250:1250;

%DSB-FC
AM = (1 + x) .* y;
subplot(3, 2, 1);
plot(t, AM);
title("DSB-FC Signal"); xlabel("Time"); ylabel("Amplitude");
sam=fftshift(abs(fft(AM)));
subplot(3, 2, 2);
plot(f,sam); xlim([-100, 100]), ylim([0, 1500]);
title("Spectrum of DSB-FC");

% DSB-SC
DSBSC = x .* y;
subplot(3, 2, 3);
plot(t, DSBSC);
title("DSB-SC Signal"); xlabel("Time"); ylabel("Amplitude");
s4 = fftshift(abs(fft(DSBSC)));
subplot(3, 2, 4);
plot(f, s4); xlim([-100, 100]); ylim([0, 1500]);
title("Spectrum of DSB-SC");

% SSB-SC
SSBSC = sin(2*pi*fm*t) .* cos(2*pi*fc*t) + cos(2*pi*fm*t) .* sin(2*pi*fc*t);
subplot(3, 2, 5);
plot(t, SSBSC); 
title("SSB-SC Signal"); xlabel("Time"); ylabel("Amplitude");
s5 = fftshift(abs(fft(SSBSC)));
subplot(3, 2, 6);
plot(f, s5); xlim([-100, 100]); ylim([0, 1500]);
title("Spectrum of SSB-SC");
