clc; clear all; close all;
wp=0.2*pi;
ws=0.3*pi;
wc=(ws+wp)/2;
fc=wc/pi;
TW=ws-wp;
M=ceil(6.6*pi/TW);
n=0:M-1;
alpha=ceil(M-1)/2;
m=n-alpha;
hd=fc*sinc(fc*m);
w=hamming(M)';
h=hd.*w;
subplot(311); stem(n, hd); xlabel("n->"); ylabel('hd(n)'); title("Ideal impulse response");
subplot(312); stem(n, w); xlabel('n->'); ylabel('w(n)'); title("Hamming window");
subplot(313); stem(n, h); xlabel('n->'); ylabel('h(n)'); title("Finite impulse response - FIR");
figure
freqz(h)