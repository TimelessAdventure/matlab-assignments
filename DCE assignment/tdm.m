clc; clear; close all;
Fs = 1000;          
t = 0:1/Fs:0.05;    
m1 = sin(2*pi*25*t); 
m2 = square(2*pi*30*t);
m3 = sawtooth(2*pi*3*t);
mux = zeros(1, length(t)*3);
mux(1:3:end) = m1;
mux(2:3:end) = m2;
mux(3:3:end) = m3;
dm1 = mux(1:3:end);
dm2 = mux(2:3:end);
dm3 = mux(3:3:end);
td = linspace(0, max(t), length(dm1));
figure; y_limits = [-1.2, 1.2];

subplot(4,2,1); 
plot(t,m1); ylim(y_limits);
title('Original Signal 1 (Sine)'); xlabel('Time (s)'); ylabel('Amp');

subplot(4,2,3); 
plot(t,m2); ylim(y_limits);
title('Original Signal 2 (Square)'); xlabel('Time (s)'); ylabel('Amp');

subplot(4,2,5); 
plot(t,m3); ylim(y_limits);
title('Original Signal 3 (Sawtooth)'); xlabel('Time (s)'); ylabel('Amp');

subplot(4,2,7); 
stem(mux(1:150)); ylim(y_limits); 
title('TDM Multiplexed Stream'); xlabel('Sample'); ylabel('Amp');

subplot(4,2,2); 
plot(td,dm1); ylim(y_limits);
title('Demuxed Signal 1'); xlabel('Time (s)'); ylabel('Amp');

subplot(4,2,4); 
plot(td,dm2); ylim(y_limits);
title('Demuxed Signal 2'); xlabel('Time (s)'); ylabel('Amp');

subplot(4,2,6); 
plot(td,dm3); ylim(y_limits);
title('Demuxed Signal 3'); xlabel('Time (s)'); ylabel('Amp');