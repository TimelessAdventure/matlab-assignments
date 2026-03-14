clc; clear all; close all;
% unit impulse
t=-10:0.01:10;
x1=(t==0);
subplot(2, 3, 1);
plot(t, x1); xlabel("time t->"); ylabel('x1(t)'); title('Unit Impulse');
% unit step
u=(t>0);
subplot(2, 3, 2);
plot(t, u); axis([-10 10 -2 2]); xlabel('time t->'); ylabel("u(t)"); title("Unit Step");
% unit ramp
r=t.*u;
subplot(2, 3, 3);
plot(t, r); xlabel('time t->'); ylabel("r(t)"); title("Unit Ramp");
% unit parabolic
p=0.5*(t.^2).*u;
subplot(2, 3, 4);
plot(t, p); xlabel('time t->'); ylabel('p(t)'); title("Unit Parabolic");
% exponential
a=0.5; 
x2=exp(a*t);
subplot(2, 3, 5);
plot(t, x2); xlabel('time t->'); ylabel('x2(t)'); title('Exponential');
% sinusoidal
f1=5;
x3=sin(2*pi*f1*t);
subplot(2, 3, 6);
plot(t, x3); axis([-1 1 -2 2]); xlabel('time t->'); ylabel('x3(t)'); title('Sinusoidal');
