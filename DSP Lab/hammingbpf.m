% Question:
% Design the following digital FIR bandpass filter with stop band edges
% ws1=0.3pi, ws2=0.9pi, and passband edges wp1=0.35pi, and wp2=0.5pi. 
% Choose Hamming window function, determine impulse response and plot frequency
% response of the filter.

clc; clear all; close all;

wp1=0.35*pi; ws1=0.3*pi; 
wp2=0.5*pi; ws2=0.9*pi; 

wc1=(ws1+wp1)/2; fc1=wc1/pi;
wc2=(ws2+wp2)/2; fc2=wc2/pi;
TW=(wp1-ws1);

M=ceil(6.6*pi/TW);
n=0:M-1;
alpha=ceil((M-1)/2);
m=n-alpha;
hd=fc2*sinc(fc2*m)-fc1*sinc(fc1*m);
w=hamming(M);
h = hd .* w';

figure
subplot(211); stem(n, w); xlabel('n->'); ylabel('w(n)'); title("Hamming window");
subplot(212); stem(n, h); xlabel('n->'); ylabel('h(n)'); title("Impulse response");

figure
freqz(h)