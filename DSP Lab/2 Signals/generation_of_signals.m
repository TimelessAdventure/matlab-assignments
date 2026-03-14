clc; clear all; close all;
% signal a
n=-5:5;
d1=(n==-2);
d2=(n==4);
x=2*d1-d2;
subplot(2,2,1);
stem(n,x);xlabel('n->');ylabel('x(n)');title('signal A');

n=0:20;
u1=(n>=0);
u2=(n>=10);
u3=(n>=20);
x=n.*(u1-u2)+10*exp(-0.3*(n-10)).*(u2-u3);
subplot(2,2,2)
stem(n,x);xlabel('n->');ylabel('x(n)');title('signal b');

n=0:50;
x=cos(0.04*pi*n)+0.2*randn(size(n));
subplot(2,2,3)
stem(n,x);xlabel('n->');ylabel('x(n)');title('signal c');

n=-10:9;
x=[5,4,3,2,1]
x4=x;
for i=1:3
    x4=[x4,x];
end
subplot(2,2,4)
stem(n,x4);xlabel('n->');ylabel('x(n)');title('signal d');

