clear; close all; clc;

E1 = 1.0; E2 = 0.6; delta = pi/4;
N = 100;

x = [linspace(-E1, E1, N), linspace(E1, -E1, N)];
y = zeros(size(x));
a = 1 / E2^2;
sin_sq = sin(delta)^2;

for i = 1:length(x)
    b = -(2 * x(i) * cos(delta)) / (E1 * E2);
    c = (x(i) / E1)^2 - sin_sq;
    d = sqrt(max(0, b^2 - 4*a*c));
    if i <= N, y(i) = (-b + d)/(2*a); else, y(i) = (-b - d)/(2*a); end
end

figure('Color', 'w', 'Position', [100, 100, 800, 400]);

subplot(1,2,1); hold on; axis equal; grid on; title('RHE (Clockwise)');
xlim([-1.2 1.2]); ylim([-1.2 1.2]);
plot(x, y, 'k--'); 
h_p1 = plot(0,0,'ro','MarkerFaceColor','r'); h_l1 = line([0 0],[0 0],'Color','r','LineWidth',2);

subplot(1,2,2); hold on; axis equal; grid on; title('LHE (Counter-Clockwise)');
xlim([-1.2 1.2]); ylim([-1.2 1.2]);
plot(x, y, 'k--'); 
h_p2 = plot(0,0,'bo','MarkerFaceColor','b'); h_l2 = line([0 0],[0 0],'Color','b','LineWidth',2);

len = length(x);
for i = 1:len
    set(h_p1, 'XData', x(i), 'YData', y(i));
    set(h_l1, 'XData', [0, x(i)], 'YData', [0, y(i)]);
    idx_LHE = len - i + 1;
    set(h_p2, 'XData', x(idx_LHE), 'YData', y(idx_LHE));
    set(h_l2, 'XData', [0, x(idx_LHE)], 'YData', [0, y(idx_LHE)]);
    
    pause(0.02);
end