clc; clear; close all;

N = 50;                 
Fs = 100;               
Tb = 1;                 
t = 0:1/Fs:N*Tb-1/Fs;   

bits = randi([0 1],1,N);
x = repelem(bits,Fs);   

delta = 0.3;             
xq = zeros(1,length(x)); 
y = zeros(1,length(x));  

for i=2:length(x)
    if x(i) > xq(i-1)
        y(i) = 1;
        xq(i) = xq(i-1) + delta;
    else
        y(i) = 0;
        xq(i) = xq(i-1) - delta;
    end
end

figure;
subplot(3,1,1); plot(t,x); grid on;
title('Random Bitstream (NRZ)'); xlabel('Time (s)'); ylabel('Amplitude');
axis([0 20 -0.2 1.2]);

subplot(3,1,2); stairs(1:N, y(1:Fs:end)); grid on;
title('Delta Modulation'); xlabel('Time (s)'); ylabel('Amplitude');
axis([0 N+1 -0.2 1.2]);

subplot(3,1,3); plot(t,xq); grid on;
title('Reconstructed Signal'); xlabel('Time (s)'); ylabel('Amplitude');
axis([0 20 -0.5 1.5]);
