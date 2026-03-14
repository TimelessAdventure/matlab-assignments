clc; clear all; close all;
nxb = -3; nxe = 3;
nx = nxb:nxe; 
x = [3, 11, 7, 0, -1, 4, 2];
subplot(4,1,1); stem(nx,x); 
xlabel('n ->'); ylabel('x(n)'); title('Input Sequence');
nhb = -1; nhe = 4; 
nh = nhb:nhe; 
h = [2, 3, 0, -5, 2, 1];
subplot(4,1,2); stem(nh,h); 
xlabel('n ->'); ylabel('h(n)'); title('Impulse Response');
nyb = nxb + nhb; 
nye = nxe + nhe;
ny = nyb:nye; 
y = conv(x,h);
subplot(4,1,3); stem(ny,y); 
xlabel('n ->'); ylabel('y(n)'); title('Convolution output');
l1 = length(x); l2 = length(h); l3 = l1 + l2 - 1; 
disp('Using built in function - conv');
disp(y)
x = [x,zeros(1,(l3-l1))];
X=fft(x);
h = [h,zeros(1,(l3-l2))]; 
H = fft(h);
Y = X.*H; 
y2 = ifft(Y);
disp('Using frequency domain method')
disp(y2)
subplot(4,1,4); stem(ny,y2); 
xlabel('n ->'); ylabel('y(n)'); title('Frequency domain method');
x = [x,zeros(1,(l2-1))]; h = [h,zeros(1,(l1-1))];z1= zeros(1,l3)
for i=1:l3
for j= 1 : i
z1(i)=z1(i)+x(j)*h(i-j+1);
end
end
disp(z1)