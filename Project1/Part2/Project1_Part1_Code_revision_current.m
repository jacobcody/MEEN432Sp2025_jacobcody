% Initialization
theta0 = 0; % rad
omega_init = [10,0]; % Angular velocity in rad/s
J1 = [100, 0.01]; % Inertia in kg m^2
b_val = [10, 0.1]; % damping coefficient Nm/(rad/s)
tau = [0, 100]; %d
t_freq = [0.1, 100]; %rad/s

torque_mode = [0,1]; % 0 is sinusoidal, 1 is constant torque
dT_values = [0.001, 0.1, 1]; % Time steps

fixed_solver = ["ode1", "ode4"]; % Ode1 is Euler and Ode4 is Runge Kutta
variable_solver = ['ode45','ode23tb'];
stopTime = 25; % stop time in sec
time_data = []; % Initialize array to store CPU time data
fig_storage = {}; %storage
eigen_val_storage = [];


set_param('Project1_Part1_Model_current', 'FastRestart', 'off') %this helps with iterations
load_system("Project1_Part1_Model_current.slx")

for dT = dT_values
    for solver = fixed_solver
        for J = J1
            for b = b_val
                for torque = torque_mode
                    try
    
                        set_param('Project1_Part1_Model_current', 'Solver', solver, 'FixedStep', num2str(dT));
                
                        tic; %starts timer
                
                        sim('Project1_Part1_Model_current');  
                
                        tout = 0:dT:stopTime; %time vector
                        omega_anal = tau0/b * (1 - exp(-b/J*tout)) + omega0 * b/J;
                
                        fig_storage{end+1} = figure('Visible', 'off');
                        plot(tout, omega_anal, 'r')
                        xlabel('time (s)')
                        ylabel('angular velocity (rad/s)')
                        title(['Theoretical Rotational Speed of Shaft' newline ...
                       'Solver: ' solver newline ...
                       'dT: ' num2str(dT) ' s'], 'Interpreter', 'none');
                
                        fig_storage{end+1} = figure('Visible', 'off');
                        plot(out.omega.time, out.omega.Data, '-+')
                        grid on
                        xlabel('time (s)')
                        ylabel('angular velocity (rad/s)')
                        title(['Simulated Rotational Speed (Solver: ' solver ', dT: ' num2str(dT) ' s)'])
                
                        fig_storage{end+1} = figure('Visible', 'off');
                        plot(out.theta.time, out.theta.Data);
                        grid on
                        xlabel('time (s)')
                        ylabel('position (rad)')
                        title(['Position of Shaft (Solver: ' solver ', dT: ' num2str(dT) ' s)'])
                
                        fig_storage{end+1} = figure('Visible', 'off');
                        plot(out.DampingForce.time, out.DampingForce.Data);
                        grid on
                        xlabel('time (s)')
                        ylabel('Damping Force (N)')
                        title(['Damping Force (Solver:' solver ', dT: ' num2str(dT) ' s)'])
                
                        fig_storage{end+1} = figure('Visible', 'off');
                        plot(out.ActuationForce.time, out.ActuationForce.Data);
                        grid on
                        xlabel('time (s)')
                        ylabel('Actuation Force (N)')
                        title(['Actuation Force (Solver: ' solver ', dT: ' num2str(dT) ' s)'])
    
                        elapsed_time = toc;
                        time_data = [time_data, elapsed_time]; %appending cpu time per sim
                
                        error = abs(out.omega.Data - omega_anal); %error between theoretical and analytical velocities
                        max_sim_error = max(error); % max error

                        eigen_val = -b/J;
                        eigen_val_storage = [eigen_val_storage,eigen_val];


                    end
                end
            end
        end
    end
end

fig6 = figure;
hold on;
plot(dT_values, time_data(1:3), '-*', 'LineWidth', 1, 'MarkerSize', 5, 'Color', 'b'); 
plot(dT_values, time_data(4:6), '-*', 'LineWidth', 1, 'MarkerSize', 5, 'Color', 'r'); 
xlabel('Time Step (s)');  
ylabel('CPU Time (seconds)');
title('CPU Time vs Time Step for Fixed Time Step Integration Methods');
grid on;
legend('Euler (ode1)', 'Runge Kutta 4th Order (ode4)', 'Location', 'northwest');

% Plot: Max Simulation Error vs Time Step for Fixed Time Step Integration Methods
fig7 = figure;
hold on;
plot(dT_values, error(1:3), '-o', 'LineWidth', 1, 'MarkerSize', 5, 'DisplayName', 'Euler (ode1)');
plot(dT_values, error(4:6), '-o', 'LineWidth', 1, 'MarkerSize', 5, 'DisplayName', 'Runge Kutta 4th Order (ode4)');
xlabel('Time Step (s)');
ylabel('Max Simulation Error');
title('Max Simulation Error vs Time Step for Fixed Step Methods');
grid on;
legend show;

% Plot: CPU Time Taken vs Time Step for Fixed Time Step Integration Methods
fig8 = figure;
hold on;
plot(dT_values, time_data(1:3), '-*', 'LineWidth', 1, 'MarkerSize', 5, 'DisplayName', 'Euler (ode1)');
plot(dT_values, time_data(4:6), '-*', 'LineWidth', 1, 'MarkerSize', 5, 'DisplayName', 'Runge Kutta 4th Order (ode4)');
xlabel('Time Step (s)');
ylabel('CPU Time (seconds)');
title('CPU Time vs Time Step for Fixed Step Methods');
grid on;
legend show;

% Plot: Max Simulation Error vs CPU Time for Each Integration Method
fig9 = figure;
hold on;
plot(time_data(1:3), error(1:3), '-s', 'LineWidth', 1, 'MarkerSize', 5, 'DisplayName', 'Euler (ode1)');
plot(time_data(4:6), error(4:6), '-s', 'LineWidth', 1, 'MarkerSize', 5, 'DisplayName', 'Runge Kutta 4th Order (ode4)');
xlabel('CPU Time (seconds)');
ylabel('Max Simulation Error');
title('Max Simulation Error vs CPU Time for Integration Methods');
grid on;
legend show;


