clc; close all; clear all;
n1= -2:1;
x=[2 4 6 8];
n2=0:3;
y=[1 3 5 7];
n=-2:3;
y1=zeros(1, 6);
y2=y1;
y1 (find((n>=min(n1))&(n<=max(n1))==1))=x;
y2 (find((n>=min(n2))&(n<=max(n2))==1))=y;

subplot(3, 2, 1);
stem(n1, x); xlabel('n->'); ylabel('x(n)'); title('Input sequence 1');
subplot(3, 2, 2);
stem(n2, y); xlabel('n->'); ylabel('y(n)'); title('Input sequence 2');

z1=y1+y2;
subplot(3, 2, 3);
stem(n,z1); xlabel('n->'); ylabel('z1(n)'); title('Signal addition');

z2=y1-y2;
subplot(3, 2, 4);
stem(n,z2); xlabel('n->'); ylabel('z2(n)'); title('Signal subtraction');

z3=y1.*y2;
subplot(3, 2, 5);
stem(n,z3); xlabel('n->'); ylabel('z3(n)'); title('Signal multiplication');

