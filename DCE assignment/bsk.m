clc; clear all; close all;
x=randi([0, 1], 1, 10);
Eb=4; Tb=10;
fc1=.4;
fc2=.2;
fs=50;
t = 0:1/fs:(length(x)*Tb - 1/fs);
samplebit = fs * Tb;
subplot(411);
stairs(0:9, x); xlabel("Time"); title("Input Binary"); ylim([-0.5 1.5]); xlim([0 10]);

%BASK
s1=sqrt(2*Eb/Tb)*cos(2*pi*fc1.*t);
m = repelem(x, fs*Tb);
y=s1.*m;
subplot(412);
plot(t,y); xlabel("Time"); ylabel("Amplitude"); title("BASK"); 

%BFSK
s1=sqrt(2*Eb/Tb)*cos(2*pi*fc1.*t);
s2=sqrt(2*Eb/Tb)*cos(2*pi*fc2.*t);
y = zeros(size(t));
for i = 1:length(x)
    start = (i-1)*samplebit + 1;
    finish = i*samplebit;
    if x(i) == 1
        y(start:finish) = s1(start:finish);
    else
        y(start:finish) = s2(start:finish);
    end
end
subplot(413);
plot(t,y); xlabel("Time"); ylabel("Amplitude"); title("BFSK"); 

%BPSK
s1 = sqrt(2*Eb/Tb)*cos(2*pi*fc1.*t);     
s2 = sqrt(2*Eb/Tb)*cos(2*pi*fc1.*t + pi);
y = zeros(size(t));
for i = 1:length(x)
    start = (i-1)*samplebit + 1;
    finish = i*samplebit;
    if x(i) == 1
        y(start:finish) = s1(start:finish);
    else
        y(start:finish) = s2(start:finish);
    end
end
subplot(414);
plot(t,y); xlabel("Time"); ylabel("Amplitude"); title("BPSK"); 