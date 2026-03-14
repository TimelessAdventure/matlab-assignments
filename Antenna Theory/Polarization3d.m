clear; close all; clc;

% --- Parameters ---
Ex0 = 1.0;          % Magnitude x (E1)
Ey0 = 0.6;          % Magnitude y (E2) - Must be unequal for general ellipse
w = 5;              % Angular frequency (omega)
k = 2;              % Wave number
z = linspace(0, 10, 500); % Propagation distance
t_vec = 0:0.05:20;  % Time vector for animation Loop

% --- Phase Differences (Delta = phi_y - phi_x) ---
% Constraint: Delta cannot be 0 (Linear) or +/- pi/2 (Standard Ellipse/Circular)
% We use +/- pi/4 to create a 'Tilted' Elliptical Polarization
delta_CW = pi/4;   
delta_CCW = -pi/4; 

figure('Color', 'w', 'Position', [100, 100, 1200, 600]);

for idx = 1:length(t_vec)
    t = t_vec(idx);
    subplot(1, 2, 1);
    Ex_CW = Ex0 * cos(w*t + k*z); 
    Ey_CW = Ey0 * cos(w*t + k*z + delta_CW);   
    plot3(z, Ex_CW, Ey_CW, 'b', 'LineWidth', 1.5); hold on;
    
    % Plot Electric Field Vector at z=0 (Source)
    % We emphasize the rotation at the start of the axis
    Ex_vec_CW = Ex0 * cos(w*t);
    Ey_vec_CW = Ey0 * cos(w*t + delta_CW);
    
    % Draw the vector arrow (Quiver)
    quiver3(0, 0, 0, 0, Ex_vec_CW, Ey_vec_CW, 0, 'r', 'LineWidth', 3, 'MaxHeadSize', 0.5);
    
    % Draw the Ellipse trace at z=0 to show the polarization shape clearly
    theta = linspace(0, 2*pi, 100);
    trace_x = Ex0 * cos(theta);
    trace_y = Ey0 * cos(theta + delta_CW);
    plot3(zeros(size(theta)), trace_x, trace_y, 'k--', 'LineWidth', 0.5);
    
    % Formatting
    grid on; axis equal;
    xlim([0, 10]); ylim([-1.2, 1.2]); zlim([-1.2, 1.2]);
    xlabel('Z (Propagation)'); ylabel('Ex'); zlabel('Ey');
    title(['Right Hand / CW (Delta = + \pi/4)']);
    view(45, 30);
    hold off;

    % ==========================================
    % PLOT 2: Counter-Clockwise (CCW) / Left Hand
    % ==========================================
    subplot(1, 2, 2);
    
    % Apply Eq 2-56 and 2-57
    Ex_CCW = Ex0 * cos(w*t + k*z); 
    Ey_CCW = Ey0 * cos(w*t + k*z + delta_CCW);
    
    % Plot 3D trace
    plot3(z, Ex_CCW, Ey_CCW, 'r', 'LineWidth', 1.5); hold on;
    
    % Plot Electric Field Vector at z=0
    Ex_vec_CCW = Ex0 * cos(w*t);
    Ey_vec_CCW = Ey0 * cos(w*t + delta_CCW);
    
    % Draw the vector arrow
    quiver3(0, 0, 0, 0, Ex_vec_CCW, Ey_vec_CCW, 0, 'b', 'LineWidth', 3, 'MaxHeadSize', 0.5);
    
    % Draw the Ellipse trace at z=0
    trace_x_ccw = Ex0 * cos(theta);
    trace_y_ccw = Ey0 * cos(theta + delta_CCW);
    plot3(zeros(size(theta)), trace_x_ccw, trace_y_ccw, 'k--', 'LineWidth', 0.5);
    
    % Formatting
    grid on; axis equal;
    xlim([0, 10]); ylim([-1.2, 1.2]); zlim([-1.2, 1.2]);
    xlabel('Z (Propagation)'); ylabel('Ex'); zlabel('Ey');
    title(['Left Hand / CCW (Delta = - \pi/4)']);
    view(45, 30);
    hold off;
    
    drawnow;
end