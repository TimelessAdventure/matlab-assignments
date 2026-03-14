clc; clear all; close all;
x=input('Enter the sequence: ');
y=xcorr(x, x);
figure;
subplot(211); stem(x); ylabel('Amplitude'); 
xlabel('n->'); title('Input sequence');
subplot(212); stem(fliplr(y)); ylabel('Amplitude'); 
xlabel('n->'); title('Output sequence');
disp('The resultant is ')
fliplr(y)