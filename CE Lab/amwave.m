clc; clear all; close all; 
fm = 50;
t=0:.0001:.25 ;
fs = 1 / (t(2) - t(1));
%message s/g
x=sin(2*pi*fm*t);
subplot(4, 2, 1);
plot(t,x);
title("Message wave"); xlabel("Time");ylabel("Amplitude");
%Carrier s/g
fc =  100;
y=sin(2*pi*fc*t);
subplot(4, 2, 2);
plot(t, y);
title("Carrier wave"); xlabel("Time");ylabel("Amplitude");
% AM wave
AM = (1 + x) .* y;
subplot(4, 2, 3);
plot(t, AM);
title("AM Signal, m=1"); xlabel("Time"); ylabel("Amplitude");
% Spectrum of AM
f=-1250:1250;
sam=fftshift(abs(fft(AM)));
subplot(4, 2, 4); 
plot(f,sam);xlim([-100, 100])
title("Spectrum");
% AM wave
AMhalf = (1 + 0.5*x) .* y;
subplot(4, 2, 5);
plot(t, AM);
title("AM Signal, m=0.5"); xlabel("Time"); ylabel("Amplitude");
% Spectrum of AM
sam=fftshift(abs(fft(AMhalf)));
subplot(4, 2, 6);
plot(f,sam);xlim([-100, 100])
title("Spectrum of m=0.5");
% AM wave
AM = (1 + 2*x) .* y;
subplot(4, 2, 7);
plot(t, AM);
title("AM Signal, m=2"); xlabel("Time"); ylabel("Amplitude");
% Spectrum of AM
sam=fftshift(abs(fft(AM)));
subplot(4, 2, 8);
plot(f,sam); xlim([-100, 100])
title("Spectrum of m=2");

figure;
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
plot(f, s4); xlim([-100, 100]);ylim([0, 1500]);
title("Spectrum of DSB-SC");

% SSB-SC
SSBSC = sin(2*pi*fm*t) .* cos(2*pi*fc*t) + cos(2*pi*fm*t) .* sin(2*pi*fc*t);
subplot(3, 2, 5);
plot(t, SSBSC); 
title("SSB-SC Signal"); xlabel("Time"); ylabel("Amplitude");
s5 = fftshift(abs(fft(SSBSC)));
subplot(3, 2, 6);
plot(f, s5); xlim([-100, 100]);ylim([0, 1500]);
title("Spectrum of SSB-SC");

% demodulation
figure;
[b, a] = butter(6, fm/(fs/2));
msg_am = filtfilt(b, a, abs(AM));
subplot(3, 1, 1);
plot(t, msg_am);
title('Demodulated AM'); xlabel('Time'); ylabel('Amplitude');

demod_dsbsc=DSBSC.*sin(2*pi*fc*t);
msg_dsbsc=filtfilt(b, a, demod_dsbsc);
subplot(3, 1, 2)
plot(t, msg_dsbsc);
title('Demodulated DSB-SC'); xlabel('time'); ylabel('Amplitude');

demod_ssbsc = SSBSC.*cos(2*pi*fc*t);
msg_ssbsc = filtfilt(b, a, demod_ssbsc);
subplot(3, 1, 3);
plot(t, msg_ssbsc);
title('Demodulated SSB-SC'); xlabel('time'); ylabel('Amplitude');
