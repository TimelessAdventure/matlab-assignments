clc; clear all; close all;
alpha=3; beta=4;
a=[1 2 3];
b=[1 2];
x1=rand(1, 10);
y1=filter(b, a, x1);
x2=rand(1, 10);
y2=filter(b, a, x2);
x=alpha*x1+beta*x2;
y=filter(b, a, x);
y3=alpha*y1+beta*y2;
if (abs(y3-y)<0.0001)
    disp("System A is linear");
else
    disp("System A is non-linear");
end
subplot(2, 2, 1);
stem(y); xlabel('n->'); ylabel('y(n)'); 
title('Output due to sum of inputs - System A')
subplot(2, 2, 2);
stem(y3); xlabel('n->'); ylabel('y3(n)');
title('Sum of outputs - System A')

x1=rand(1, 10);
y1=2*x1+4;
x2=rand(1, 10);
y2=2*x2+4;
x=alpha*x1+beta*x2;
y=2*x+4;
y3=alpha*y1+beta*y2;
if(abs(y3-y)<0.0001)
    disp('System B is linear');
else
    disp('System B is non-linear');
end
subplot(2, 2, 3);
stem(y); xlabel('n->'); ylabel('y(n)'); ylim([0,40]);
title('Output due to sum of inputs - System B')
subplot(2, 2, 4);
stem(y3); xlabel('n->'); ylabel('y3(n)'); ylim([0,40]);
title('Sum of outputs - System B')