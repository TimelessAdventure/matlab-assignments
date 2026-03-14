clc; close all; clear all;
x1=input('Enter the first sequence :');
x2=input('Enter the second sequence: ');
N1=length(x1); N2=length(x2); N=max(N1,N2);
y=cconv(x1,x2,N);
n1=0:N1-1
subplot(2,2,1); stem(n1,x1); title('Input sequence'); xlabel('n ->'); ylabel('x1(n)')
n2=0:N2-1
subplot(2,2,2); stem(n2,x2); title('Input sequence'); xlabel('n ->'); ylabel('x2(n)')
n=0:N-1
subplot(2,2,3); stem(n,y); title('Output sequence'); xlabel('n ->'); ylabel('y(n)')
x1=[x1 zeros(1, N-N1)]; x2=[x2 zeros(1, N-N2)]; y1= zeros(1,N);
for n=1:N
for m= 1 : N
j=mod(n-m , N)
j=j+1
y1(n)=y1(n)+x1(m)*x2(j)
end
end
disp(y1)