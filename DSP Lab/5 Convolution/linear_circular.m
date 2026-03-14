clc; close all; clear all;
x1=input('Enter the first sequence :');
x2=input('Enter the second sequence: ');
N1=length(x1); N2=length(x2); N=N1+N2-1;
y1=conv(x1,x2); 
y=cconv(x1,x2,N);
n1=0:N1-1
subplot(2,2,1); stem(n1,x1); title('Input sequence 1'); xlabel('n ->'); ylabel('x1(n)')
n2=0:N2-1
subplot(2,2,2); stem(n2,x2); title('Input sequence 2'); xlabel('n ->'); ylabel('x2(n)')
n=0:N-1
subplot(2,2,3); stem(n,y1); title(' Linear convolution'); xlabel('n ->'); ylabel('y(n)')
subplot(2,2,4); stem(n,y); title('Circular convolution'); xlabel('n ->'); ylabel('y(n)')