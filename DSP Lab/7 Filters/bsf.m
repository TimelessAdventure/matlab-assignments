clc; clear all; close all;
wc1=pi/3;
fc1=wc1/pi;
wc2=2*pi/3;
fc2 = wc2/pi;
M=45;
n=0:M-1;
alpha=ceil((M-1)/2);
m=n-alpha;
hd = sinc(m) - (fc2*sinc(fc2*m) - fc1*sinc(fc1*m));
w=hann(M)';
h = hd .* w;
subplot(311); stem(n, hd); xlabel("n->"); ylabel('hd(n)'); title("Ideal impulse response");
subplot(312); stem(n, w); xlabel('n->'); ylabel('w(n)'); title("Hann window");
subplot(313); stem(n, h); xlabel('n->'); ylabel('h(n)'); title("Finite impulse response - FIR");
figure
freqz(h)