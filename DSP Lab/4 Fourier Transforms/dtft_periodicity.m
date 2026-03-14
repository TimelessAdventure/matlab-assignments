clc; clear all; close all; 
n=0:10;
x=(0.9*exp(1j*pi/3)).^n;
M=100;
k=-2*M:2*M;
w=(pi/M)*k;
W=exp(-1j*pi/M).^(n'*k);
X=x*W;
figure
subplot(2, 1, 1);
plot(w/pi, abs(X)); xlabel('w-> (normalised frequency)');
ylabel('|X(e^jw)|'); title('Magnitude response');
subplot(2, 1, 2);
plot(w/pi, angle(X)); xlabel('w-> (normalised frequency)'); 
ylabel('angle X(e^jw)'); title('Phase response');