clc; clear all; close all;
k=4;
a=[1 2 3];
b=[2 3];
x=rand(1, 10);
y=filter(b, a, x);
xshift=[zeros(1, k), x];
rhs=[zeros(1, k), y];
lhs=filter(b, a, xshift);
subplot(2, 2, 1);
stem(rhs); xlabel('n->'); ylabel('rhs'); title('Shifted output')
subplot(2,2,2);
stem(lhs); xlabel('n->'); ylabel('lhs'); title('Output due to shift');
if (abs(lhs-rhs)<0.0001)
    disp('System A is time invariant')
else
    disp('System A is not time invariant');
end

x=rand(1, 10);
x1=[zeros(1, 4), x];
n=1:14;
x2=2.*n.*x1;
n=1:10;
y=2.*x.*n;
rhs=[zeros(1, 4), y];
subplot(2, 2, 3);
stem(rhs); xlabel('n->');ylabel('rhs'); title('Shifted output'); ylim([0, 20]);
subplot(2, 2, 4);
stem(x2); xlabel('n->'); ylabel('x2'); title('Output due to shifted input'); ylim([0, 20]);
if (abs(rhs-x2)<0.0001)
    disp('System B is time invariant')
else
    disp('System B is time variant');
end