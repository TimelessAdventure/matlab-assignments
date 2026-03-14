clc; clear all; close all;

fm=2;
t=0:0.0001:5;
y=sin(2*pi*fm*t);
subplot(311)
plot(t,y)

fs=22;
Ts=1/fs;
n=0:Ts:max(t);
z= sin(2*pi*fm*n);
subplot(312);
stem(n, z); hold on; plot(n, z)

x=zeros(size(t));
for k=1:length(n)
    x=x+z(k)*sinc((t-n(k))/Ts);
end
subplot(313);
plot(t,x); 