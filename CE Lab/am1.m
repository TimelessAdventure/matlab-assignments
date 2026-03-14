clc; clear all; close all; 
fm = 50;
t=0:.0001:.25 ;
fs = 1 / (t(2) - t(1));
%message s/g
x=sin(2*pi*fm*t);
subplot(3, 2, 1);
plot(t,x);
title("Message wave"); xlabel("Time");ylabel("Amplitude");

%Carrier s/g
fc =  100;
y=sin(2*pi*fc*t);
subplot(3, 2, 2);
plot(t, y);
title("Carrier wave"); xlabel("Time");ylabel("Amplitude");

% AM wave, m=1
AM = (1 + x) .* y;
subplot(3, 2, 3);
plot(t, AM);
title("AM Signal, m=1"); xlabel("Time"); ylabel("Amplitude");

% Spectrum of AM
f=-1250:1250;
sam=fftshift(abs(fft(AM)));
subplot(3, 2, 4); 
plot(f,sam); xlim([-100, 100])
title("Spectrum of AM (m=1)");

% AM wave, m=0.5
AMhalf = (1 + 0.5*x) .* y;
subplot(3, 2, 5);
plot(t, AMhalf);
title("AM Signal, m=0.5"); xlabel("Time"); ylabel("Amplitude");

% AM wave, m=2
AM2 = (1 + 2*x) .* y;
subplot(3, 2, 6);
plot(t, AM2);
title("AM Signal, m=2"); xlabel("Time"); ylabel("Amplitude");
