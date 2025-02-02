% Initialization
theta0 = 0; % rad
omega_init = [10,0]; % Angular velocity in rad/s
J1 = 100; % Inertia in kg m^2
J2 = 1 ; % Inertia in kg m^2
b1 = 1 ; % damping coefficient Nm/(rad/s)
b2 = 1 ; % damping coefficient Nm/(rad/s)
tau = [0, 100]; %d
w_freq = [0.1, 100]; %rad/s


torque_mode = [0,1]; % 0 is sinusoidal, 1 is constant torque
dT_values = [0.001, 0.1, 1]; % Time steps

fixed_solver = ["ode1", "ode4"]; % Ode1 is Euler and Ode4 is Runge Kutta
variable_solver = ['ode45','ode23tb'];
stopTime = 25; % stop time in sec
time_data = []; % Initialize array to store CPU time data
fig_storage = {}; %storage
eigen_val_storage = [];


set_param('Project1_Option2_Combined', 'FastRestart', 'off') %this helps with iterations
load_system("Project1_Option2_Combined.slx")

for dT = dT_values
    for solver = fixed_solver
        for J = J1
            for b = b_val
                for torque = torque_mode
                    for w = w_freq
                        try
        
                            set_param('Project1_Option2_Combined', 'Solver', solver, 'FixedStep', num2str(dT));
                    
                            
                    
                            sim('Project1_Option2_Combined');  
                    
                            tout = 0:dT:stopTime; %time vector
                            
                    
                            fig_storage{end+1} = figure('Visible', 'off');
                            plot(out.omega.time, out.omega.Data, '-+')
                            grid on
                            xlabel('time (s)')
                            ylabel('angular velocity (rad/s)')
                            title(['Simulated Rotational Speed (Solver: ' solver ', dT: ' num2str(dT) ' s)'])
                    
                     

                        end
                    end
                end
            end
        end
    end
end

fig1 = figure;
hold on;
plot(out.omegaoption2.time, out.omegaoption2.Data, '-*', 'LineWidth', 1, 'MarkerSize', 5, 'Color', 'b'); 
xlabel('Time (s)');  
ylabel('angular velocity (rad/s)');
title('angular velocity (rad/s) vs. time(s)');
grid on;
