clc; clear all; close all; 
wp1=0.35*pi; ws1=0.2*pi; wc1=(ws1+wp1)/2; fc1=wc1/pi;
wp2=0.65*pi; ws2=0.8*pi; wc2=(ws2+wp2)/2; fc2=wc2/pi;
TW=ws2-wp2;
M=ceil(11*pi/TW);
n=0:M-1;
alpha=ceil((M-1)/2);
m=n-alpha;
hd=fc2*sinc(fc2*m)-fc1*sinc(fc1*m);
w=blackman(M);
h = hd .* w';
subplot(311); stem(n, hd); xlabel("n->"); ylabel('hd(n)'); title("Ideal impulse response");
subplot(312); stem(n, w); xlabel('n->'); ylabel('w(n)'); title("Blackman window");
subplot(313); stem(n, h); xlabel('n->'); ylabel('h(n)'); title("Finite impulse response - FIR");
figure
freqz(h)