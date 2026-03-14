clc; clear all; close all;
x=[1 2 3 4 5]
n=0:4;
M=500;
k=0:M;
w=(pi/M)*k
W=exp(-1j*pi/M).^(n'*k);
X=x*W;
figure
subplot(2, 1, 1); plot(w/pi, 20*log10(abs(X))); xlabel('w-> (normalised frequency)'); 
ylabel('|X(e^jw)| in dB'); title('Magnitude response'); ylim([0, 30]); 
subplot(2, 1, 2); plot(w/pi, unwrap(angle(X)) * (180/pi));; xlabel('w-> (normalised frequency)'); 
ylabel('angle X(e^jw) in degrees'); title('Phase response'); ylim([-800, 0]); 
figure 
subplot(2, 1, 1); plot(w/pi, real(X)); xlabel('w-> (normalised frequency)'); 
ylabel('real X(e^jw'); title('Real response');
subplot(2, 1, 2); plot(w/pi, imag(X)); xlabel('w-> (normalised frequency)'); 
ylabel('imaginary X(e^jw)'); title('Imaginary response');
figure
freqz(x); %ylim([0, 30])