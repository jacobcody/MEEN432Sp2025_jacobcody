% Initialization
tau0 = 1; % Torque input in Nm
J = 1; % Inertia in kg m^2
b = 1; % damping coefficient Nm/(rad/s)
%initial conditions
omega0 = 0; % rad/s
theta0 = 0; % rad
timestep=.001;

% analysis
tout= 0:timestep:25;
omega_anal = tau0/b *(1- exp(-b/J*tout)) + omega0 * b/J;
fig1 = figure;
figure(fig1)
hold on
plot(tout,omega_anal,'r')
xlabel('time(s)')
ylabel('angular velocity (rad/s)')
title('Theoretical Angular Velocity of Shaft')
hold off


fig2 = figure;
plot(out.omega.time,out.omega.Data,'-+')
grid on
xlabel('time (s)')
ylabel('angular velocity (rad/s)')
title('Angular velocity of Shaft')
fig3 = figure;
plot(out.theta.time,out.theta.Data);
grid on
xlabel('time (s)')
ylabel('position (rad)')
title ('Rotation of Shaft')

fig4 = figure;
plot(out.DampingForce.time,out.DampingForce.Data);
grid on
xlabel('time (s)')
ylabel('Damping Force (N)')
title ('Damping Force')

SpeedError=minus(out.omega.data,omega_anal);
fig5 = figure;
plot(tout,SpeedError);
grid on
xlabel('time (s)')
ylabel('Error (Rad/s)')
title ('Error of Theoretical vs. Simulated Rotational Speed ')