% Initialization
tau0 = 1; % Torque input in Nm
J = 1; % Inertia in kg m^2
b = 1; % damping coefficient Nm/(rad/s)
torque_mode = 1; % 1 is constant torque, 0 is sinusoidal
% initial conditions
omega0 = 1; % rad/s
theta0 = 0; % rad
dT_values = [0.001, 0.1, 1]; % Time steps
fixed_solver = ["ode1", "ode4"]; % Ode1 is Euler and Ode4 is Runge Kutta
stopTime = 25; % stop time in sec]
time_data = [];
error_data = [];

set_param('Project1_Part1_Model', 'FastRestart', 'off') %this helps with iterations

for dT = dT_values
    for solver = fixed_solver

        set_param('Project1_Part1_Model', 'Solver', solver, 'FixedStep', num2str(dT));

        tic; %starts timer

        sim('Project1_Part1_Model');  
        tout = 0:dT:stopTime; %time vector
        omega_anal = tau0/b * (1 - exp(-b/J*tout)) + omega0 * b/J;

        fig1 = figure;
        plot(tout, omega_anal, 'r')
        xlabel('time (s)')
        ylabel('angular velocity (rad/s)')
        title(['Theoretical Rotational Speed (Solver: ' solver ', dT: ' num2str(dT) ' s)']);

        fig2 = figure;
        plot(out.omega.time, out.omega.Data, '-+')
        grid on
        xlabel('time (s)')
        ylabel('angular velocity (rad/s)')
        title(['Simulated Rotational Speed (Solver: ' solver ', dT: ' num2str(dT) ' s)']);

        fig3 = figure;
        plot(out.theta.time, out.theta.Data);
        grid on
        xlabel('time (s)')
        ylabel('position (rad)')
        title(['Position of Shaft (Solver: ' solver ', dT: ' num2str(dT) ' s)'])

        fig4 = figure;
        plot(out.DampingForce.time, out.DampingForce.Data);
        grid on
        xlabel('time (s)')
        ylabel('Damping Force (N)')
        title(['Damping Force (Solver:' solver ', dT: ' num2str(dT) ' s)']);

        fig5 = figure;
        plot(out.ActuationForce.time, out.ActuationForce.Data);
        grid on
        xlabel('time (s)')
        ylabel('Actuation Force (N)')
        title(['Actuation Force (Solver: ' solver ', dT: ' num2str(dT) ' s)']);

        error = abs(out.omega.Data - omega_anal); %error between theoretical and analytical velocities
        max_sim_error = max(error); % max error
        error_data = [error_data, max_sim_error];


        elapsed_time = toc;
        time_data = [time_data, elapsed_time]; %appending cpu time per sim

    end
end

fig6 = figure;
hold on;
plot(dT_values, time_data(1:3), '-*', 'LineWidth', 1, 'MarkerSize', 5, 'Color', 'b'); %euler iterations
plot(dT_values, time_data(4:6), '-*', 'LineWidth', 1, 'MarkerSize', 5, 'Color', 'r'); %runge kutta iterations
xlabel('Time Step (s)');  
ylabel('CPU Time (seconds)');
title('CPU Time vs Time Step for Fixed Time Step Integration Methods');
grid on;
legend('Euler (ode1)', 'Runge Kutta 4th Order (ode4)', 'Location', 'northwest');
