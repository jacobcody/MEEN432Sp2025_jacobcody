% Initialization
theta0 = 0; % rad
omega_init = [10,0]; % Angular velocity in rad/s
J1 = 100; % Inertia in kg m^2
J2 = 1 ; % Inertia in kg m^2
b1 = 1 ; % damping coefficient Nm/(rad/s)
b2 = 1 ; % damping coefficient Nm/(rad/s)
tau_val = [0, 100]; %d
w_freq = [0.1, 100]; %rad/s
k_val= [10, 100, 1000]; % spring constants in Nm


torque_mode = [0,1]; % 0 is sinusoidal, 1 is constant torque
dT_values = [0.001, 0.1, 1]; % Time steps

fixed_solver = ["ode1", "ode4"]; % Ode1 is Euler and Ode4 is Runge Kutta
variable_solver = ['ode45','ode23tb'];
stopTime = 25; % stop time in sec
time_data = []; % Initialize array to store CPU time data
fig_storage = {}; %storage
eigen_val_storage = [];


set_param('Project1_Option1_stiffness', 'FastRestart', 'off') %this helps with iterations
load_system("Project1_Option1_stiffness.slx")

for dT = dT_values
    for solver = fixed_solver
        for J = J1
            for b = b_val
                for torque = torque_mode
                    for w = w_freq
                        for k = k_val
                            for tau = tau_val

                                 try
        
                                    set_param('Project1_Option1_stiffness', 'Solver', solver, 'FixedStep', num2str(dT));
                            
                                    tic; %starts timer
                            
                                    sim('Project1_Option1_stiffness');  
                            
                                    tout = 0:dT:stopTime; %time vector
                                    
                            
                                    fig_storage{end+1} = figure('Visible', 'off');
                                    plot(out.omegaoption1S1.time, out.omegaoption1S1.Data, '-+')
                                    grid on
                                    xlabel('time (s)')
                                    ylabel('angular velocity (rad/s)')
                                    title(['Simulated Rotational Speed (Solver: ' solver ', dT: ' num2str(dT) ' s)'])
        
                                    fig_storage{end+1} = figure('Visible', 'off');
                                    plot(out.omegaoption1S2.time, out.omegaoption1S2.Data, '-+')
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
    end
end

fig1 = figure;
hold on;
plot(out.omegaoption1S1.Data, '-*', 'LineWidth', 1, 'MarkerSize', 5, 'Color', 'b'); 
xlabel('Time (s)');  
ylabel('angular velocity (rad/s)');
title('angular velocity (rad/s) vs. time(s)');
grid on;

fig2 = figure;
hold on;
plot(out.omegaoption1S2.Data, '-*', 'LineWidth', 1, 'MarkerSize', 5, 'Color', 'b'); 
xlabel('Time (s)');  
ylabel('angular velocity (rad/s)');
title('angular velocity (rad/s) vs. time(s)');
grid on;