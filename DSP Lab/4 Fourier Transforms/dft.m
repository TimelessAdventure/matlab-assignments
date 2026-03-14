clc; clear all; close all;
N=4;
x=[1; 2; 3; 4];
n=0:N-1;
k=0:N-1;
w=exp(-1j*2*pi/N).^(k'*n);
X=w*x;
disp('Frequency domain discrete X(k)')
disp('Using DFT matrix')
disp(X);
disp('Using built in function - FFT')
disp(fft(x))
x2=fft(x);
subplot(2, 2, 1)
stem(k, abs(X)); xlabel('k->');ylabel('|X(k)|');
title('Magnitude response - DFT');
subplot(2, 2, 2);
stem(k, unwrap(angle(X))); xlabel('k->'); 
ylabel('Angle X(k) in radians'); title('Phase response - DFT');
subplot(2, 2, 3);
stem(k, abs(x2)); xlabel('k->');ylabel('|X(k)|'); 
title('Magnitude reponse - FFT');
subplot(2, 2, 4);
stem(k, unwrap(angle(x2))); xlabel('k->'); 
ylabel('angle X(k) in radians'); title('Phase response - FFT')
