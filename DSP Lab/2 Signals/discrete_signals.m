clc; clear all; close all;
%unit impulse
n=-10:10;
x1=(n==0);
subplot(2,3,1)
stem(n,x1);xlabel('n->');ylabel('x1(n)');title('umit impulse')
%unit step
u=(n>=0);
subplot(2,3,2)
stem(n,u);
axis([-10 10 -2 2]);xlabel('n->');ylabel('u(n)');title('unit step');
% unit ramp
r=u.*n;
subplot(2, 3, 3);
stem(n, r); xlabel('n->'); ylabel('r(n)'); title("Unit ramp");
% unit parabolic
p=0.5 * (n.^2).*u;
subplot(2, 3, 4);
stem(n, p); xlabel('n->'); ylabel('p(n)'); title('Parabolic');
% exponential
a=2;
x2=a.^n;
subplot(2, 3, 5);
stem(n, x2); xlabel('n->'); ylabel('x2(n)'); title("Exponential");
% sinusoidal
f1=0.05
x3=sin(2*pi*f1*n);
subplot(2, 3, 6);
stem(n, x3); xlabel('n->'); ylabel('x3(n)'); title("Sinusoidal")