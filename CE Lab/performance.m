clc; clear; close all;

N = 1e5;
snr = 0:0.5:20;

bits_bpsk = randi([0 1], N, 1);
bpsk_sym = 2*bits_bpsk - 1;

bits_qpsk = randi([0 1], 2*N, 1);
I = 2*bits_qpsk(1:2:end)-1;
Q = 2*bits_qpsk(2:2:end)-1;
qpsk_sym = (I + 1j*Q)/sqrt(2);

L = length(bpsk_sym);
f = (-L/2:L/2-1)/L;
bpsk_psd = abs(fftshift(fft(bpsk_sym))).^2 / L;
qpsk_psd = abs(fftshift(fft(qpsk_sym))).^2 / L;

figure; hold on; grid on;
plot(f,10*log10(bpsk_psd/max(bpsk_psd)),'b'); 
plot(f,10*log10(qpsk_psd/max(qpsk_psd)),'r');
xlabel('Normalized Frequency'); ylabel('PSD (dB)');
title('BPSK vs QPSK Baseband PSD'); legend('BPSK','QPSK'); 

ber_bpsk = zeros(size(snr));
ber_qpsk = zeros(size(snr));

for i = 1:length(snr)
    sym = 2*bits_bpsk - 1;
    N0 = mean(abs(sym).^2)/10^(snr(i)/10);
    rx = sym + sqrt(N0/2)*randn(size(sym));
    ber_bpsk(i) = mean(bits_bpsk ~= (rx>0));
    
    I = 2*bits_qpsk(1:2:end)-1;
    Q = 2*bits_qpsk(2:2:end)-1;
    sym = (I + 1j*Q)/sqrt(2);
    N0 = mean(abs(sym).^2)/10^(snr(i)/10);
    rx = sym + sqrt(N0/2)*(randn(size(sym)) + 1j*randn(size(sym)));
    rx_bits = zeros(2*N,1);
    rx_bits(1:2:end) = real(rx)>0;
    rx_bits(2:2:end) = imag(rx)>0;
    ber_qpsk(i) = mean(bits_qpsk ~= rx_bits);
end

figure;
plot(snr, log10(ber_bpsk),'b', snr, log10(ber_qpsk),'r');
xlabel('SNR (dB)'); ylabel('log_{10}(BER)');
title('BER vs SNR'); legend('BPSK','QPSK'); grid on;

figure;
subplot(1,2,1);
plot([-1 1],[0 0],'bo'); grid on;
xlabel('I'); ylabel('Q'); title('BPSK');
xlim([-1.5 1.5]); ylim([-1 1]);

subplot(1,2,2);
plot([-1 1 1 -1]/sqrt(2), [-1 -1 1 1]/sqrt(2),'ro'); grid on;
xlabel('I'); ylabel('Q'); title('QPSK');
xlim([-1.5 1.5]); ylim([-1.5 1.5]);
