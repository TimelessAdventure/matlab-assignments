clc; clear all; close all;
E1 = 1;
E2 = 1;
delta = pi/2;         
omega = 1;
dt = 0.05;
t = 0:dt:200;

Ex = linspace(-E1, E1, 800);
Ey = linspace(-E2, E2, 800);
[EX,EY] = meshgrid(Ex,Ey);

F = (EX.^2)/(E1^2) ...
  - (2*EX.*EY)/(E1*E2)*cos(delta) ...
  + (EY.^2)/(E2^2) ...
  - sin(delta)^2;

figure;
hold on; axis equal; grid on;
xlabel('E_x'); ylabel('E_y');
title('Polarization');
xlim([-2 2]); 
ylim([-2 2]);

contour(EX,EY,F,[0 0]);

h_point = plot(0,0,'ro');

h_vec = quiver(0,0,0,0,0);

for ti = t
    Ex_t = E1*cos(omega*ti);
    Ey_t = E2*cos(omega*ti + delta);

    Vx = -E1*sin(omega*ti);
    Vy = -E2*sin(omega*ti + delta);

    set(h_point,'XData',Ex_t,'YData',Ey_t);
    set(h_vec,'XData',Ex_t,'YData',Ey_t,'UData',Vx,'VData',Vy);

    drawnow;
end