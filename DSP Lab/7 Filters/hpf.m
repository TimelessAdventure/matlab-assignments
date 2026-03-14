clc; clear all; close all;
wp=0.6*pi;
ws=0.4*pi;
wc=(wp+ws)/2;
fc=wc/pi;
TW=wp-ws;
M = ceil(6.1*pi/TW);
n=0:M-1;
alpha=ceil((M-1)/2);
m=n-alpha;
hd=sinc(m)-(fc*sinc(fc*m));
w=bartlett(M)';
h = hd .* w;
subplot(311); stem(n, hd); xlabel("n->"); ylabel('hd(n)'); title("Ideal impulse response");
subplot(312); stem(n, w); xlabel('n->'); ylabel('w(n)'); title("Bartlett window");
subplot(313); stem(n, h); xlabel('n->'); ylabel('h(n)'); title("Finite impulse response - FIR");
figure
freqz(h)