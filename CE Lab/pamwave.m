clc; clear all; close all;
fm = 1;
fc=20;
fs = 5000;
t=linspace(0, 2, fs);
%message 
x=sin(2*pi*fm*t);
subplot(5, 1, 1);
plot(t,x);
title("Message wave"); xlabel("Time");ylabel("Amplitude");
%carrier
pulse=(square(2*pi*fc*t)+1)/2;
subplot(5, 1, 2);
plot(t, pulse);
title("Pulse train"); xlabel("Time");ylabel("Amplitude");
%PAM
y=x.*pulse;
subplot(513);
plot(t, y);
title("PAM Modulated"); xlabel("Time"); ylabel("Amplitude");
%Demodulated
[b, a] = butter(2, 2*fm/(fs/2), 'low');
y_demod = filter(b, a, y);
subplot(514);
plot(t, y_demod);
title("Demodulated signal"); xlabel("Time"); ylabel("Amplitude")
%Original wave
x=sin(2*pi*fm*t);
subplot(5, 1, 5);
plot(t,x);
title("Message wave"); xlabel("Time");ylabel("Amplitude");