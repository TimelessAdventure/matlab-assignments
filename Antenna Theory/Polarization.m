% Parameters
E1 = 1;
E2 = 0.6;

% Grid for ellipse contour
Ex = linspace(-E1, E1, 1000);
Ey = linspace(-E2, E2, 1000);
[EX, EY] = meshgrid(Ex, Ey);

figure;

% -------- LHE : ANTICLOCKWISE --------
delta = pi/4;

F = (EX.^2)/(E1^2) ...
    - (2*EX.*EY)/(E1*E2)*cos(delta) ...
    + (EY.^2)/(E2^2) ...
    - sin(delta)^2;

subplot(2,1,1);
contour(EX, EY, F, [0 0]);
axis equal; grid on;
xlabel('E_x'); ylabel('E_y');
title('Left-Handed Elliptical Polarization (Anticlockwise)');

% ---- Anticlockwise arrows ----
t = linspace(0, 2*pi, 40);   % increasing t → anticlockwise
Ex_t = E1*cos(t);
Ey_t = E2*cos(t + delta);

u = -E1*sin(t);
v = -E2*sin(t + delta);

hold on;
quiver(Ex_t, Ey_t, u, v, 0.4);
hold off;

% -------- RHE : CLOCKWISE --------
delta = -pi/4;

F = (EX.^2)/(E1^2) ...
    - (2*EX.*EY)/(E1*E2)*cos(delta) ...
    + (EY.^2)/(E2^2) ...
    - sin(delta)^2;

subplot(2,1,2);
contour(EX, EY, F, [0 0]);
axis equal; grid on;
xlabel('E_x'); ylabel('E_y');
title('Right-Handed Elliptical Polarization (Clockwise)');

% ---- Clockwise arrows ----
t = linspace(0, -2*pi, 40);  % decreasing t → clockwise
Ex_t = E1*cos(t);
Ey_t = E2*cos(t + delta);

u = -E1*sin(t);
v = -E2*sin(t + delta);

hold on;
quiver(Ex_t, Ey_t, u, v, 0.4);
hold off;
