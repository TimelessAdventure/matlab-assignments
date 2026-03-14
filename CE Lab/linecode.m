clc; clear; close all;
N=20; Tb=1; bits=randi([0 1],1,N);

bit_stream=[]; 
for b=bits, bit_stream=[bit_stream b*ones(1,100)];
end
uni_nrz=[]; 
for b=bits, uni_nrz=[uni_nrz b*ones(1,100)]; 
end
polar_nrz=[]; 
for b=bits, polar_nrz=[polar_nrz (2*b-1)*ones(1,100)]; 
end

manch=[]; 
for b=bits
    if b==1
        manch=[manch ones(1,50) -ones(1,50)];
    else
        manch=[manch -ones(1,50) ones(1,50)];
    end
end

ami=[]; last=-1;
for b=bits
    if b==1
        last=-last;
        ami=[ami last*ones(1,100)];
    else
        ami=[ami zeros(1,100)];
    end
end

uni_rz=[]; 
for b=bits
    if b==1
        uni_rz=[uni_rz ones(1,50) zeros(1,50)];
    else
        uni_rz=[uni_rz zeros(1,100)];
    end
end

polar_rz=[]; 
for b=bits
    if b==1
        polar_rz=[polar_rz ones(1,50) zeros(1,50)];
    else
        polar_rz=[polar_rz -ones(1,50) zeros(1,50)];
    end
end

diff=[]; level=0;
for b=bits
    if b==1
        level=~level; 
    end
    diff=[diff level*ones(1,100)];
end

codes={bit_stream, uni_nrz, uni_rz, polar_nrz, polar_rz, ami, manch, diff};
titles={'Bit Stream','Unipolar NRZ','Unipolar RZ','Polar NRZ','Polar RZ','Bipolar AMI','Manchester','Differential'};
figure;
for k=1:8
    subplot(8,1,k);
    plot(linspace(0,N*Tb,length(codes{k})), codes{k});
    ylim([-1.5 1.5]); xlim([0 N*Tb]); title(titles{k}); grid on;
    for n=0:N, xline(n*Tb,'--k'); end
end

xlabel('Time (T_b)');
