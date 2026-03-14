clc; clear all; close all;
a=[1 -1 (1/4)];
b=[1 (1/4) (-1/8)];
n=-5:15;
x=(n==0);
y=filter(b, a, x);
subplot(2, 1, 1);
stem(n, y); title("Impulse response"); xlabel("n->"); 
ylabel('y(n)'); ylim([0, 5]);
x=(n>=0);
s=filter(b, a, x);
subplot(2, 1, 2);
stem(n,s); title("Step response"); xlabel('n->'); 
ylabel('s(n)'); ylim([0, 5]);
figure
zplane(b, a);
figure
freqz(b, a);

m=tf(b, a);
disp('Zeroes')
zero(m)
disp('Poles')
pole(m)
disp('Residues')
residuez(b, a)
if ((max(abs(pole(m)))) <=1)
    disp('All poles lie inside the circle, hence stable');
else
    disp('Poles lie outside the unit circle hence unstable');
end
if (y(n<0)==0)
    disp('Causal')
else
    disp('Not causal')
end