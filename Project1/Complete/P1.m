% Defines set parameters
theta0 = 0; % rad
J_values = [100, 0.01]; % kg-m^2
b_values = [10, 0.1]; % N-m-s/rad
w0_values = [10, 0]; % Initial angular velocities (rad/s)
A_values = [0, 100]; % Constant torques (Nm)
torque_mode = [1,0]; % 0 is sinusoidal, 1 is constant torque
frequencies = [0.1, 100]; % Sinusoidal input frequencies (rad/s)
time_steps = [0.001, 0.1, 1]; % Fixed step sizes
methods = {'ode1', 'ode4', 'ode45', 'ode23tb'}; % Euler, RK4, ode45, and ode23tb

max_sim_error_ode1_1 = [];
max_sim_error_ode1_100 = [];  %defining lists for all of our needed values
max_sim_error_ode1_1000 = [];
max_sim_error_ode4_1 = [];
max_sim_error_ode4_100 = [];
max_sim_error_ode4_1000 = [];
max_sim_error_ode45_1 = [];
max_sim_error_ode45_100 = [];
max_sim_error_ode45_1000 = [];
max_sim_error_ode23tb_1 = [];
max_sim_error_ode23tb_100 = [];
max_sim_error_ode23tb_1000 = [];
CPU_ode1_1 = [];
CPU_ode1_100 = [];
CPU_ode1_1000 = [];
CPU_ode4_1 = [];
CPU_ode4_100 = [];
CPU_ode4_1000 = [];
CPU_ode45_1 = [];
CPU_ode45_100 = [];
CPU_ode45_1000 = [];
CPU_ode23tb_1 = [];
CPU_ode23tb_100 = [];
CPU_ode23tb_1000 = [];
eigen_ode1_1 = [];
eigen_ode1_100 = [];
eigen_ode1_1000 = [];
eigen_ode4_1 = [];
eigen_ode4_100 = [];
eigen_ode4_1000 = [];
eigen_ode45_1 = [];
eigen_ode45_100 = [];
eigen_ode45_1000 = [];
eigen_ode23tb_1 = [];
eigen_ode23tb_100 = [];
eigen_ode23tb_1000 = [];

% For loops for the parameters of our problem
t_total = 25;
results = struct();
for J = J_values
    for b = b_values
        for w0 = w0_values
            for A = A_values
                 for torque = torque_mode
                    for f = frequencies
                        for dt = time_steps
                            for method = methods
                                % Set parameters in base workspace
                                assignin('base', 'J', J);
                                assignin('base', 'b', b);
                                assignin('base', 'w0', w0);
                                assignin('base', 'A', A);
                                assignin('base', 'f', f);
                                assignin('base', 'dt', dt);
    
                                % Solver parameter
                                set_param('Project1_Part1_Model_current', 'Solver', char(method));
    
                                %Calculates cpu time
                                tic;
                                simOut = sim('Project1_Part1_Model_current', 'StopTime', '25');
                                cpu_time = toc;
    
                                % Omega and time data in a list
                                t = simOut.tout;
                                w = simOut.omega.Data;
    
                                % Theoretical solution of omega
                                if torque == 1
                                    w_theoretical =  A/b * (1 - exp(-b/J*t)) + w0 * b/J;

                                else 
                                    w_theoretical = 0; % Runge Kutta equation goes here
                                end
                                
                                
                                max_error = max(abs(w - w_theoretical));

                                %iterating through the different ode's

                                if strcmp(method{1}, 'ode1') == 1
                                    if dt == .001
                                       max_sim_error_ode1_1(end+1) = max_error;
                                       CPU_ode1_1(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode1_1 = [eigen_ode1_1, eigen_val];
                                    
                                    elseif dt == .1
                                       max_sim_error_ode1_100(end+1) = max_error;
                                       CPU_ode1_100(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode1_100 = [eigen_ode1_100, eigen_val];
                                    else 
                                       max_sim_error_ode1_1000(end+1) = max_error;
                                       CPU_ode1_1000(end+1) = cpu_time; 
                                       eigen_val = -b / J;
                                       eigen_ode1_1000 = [eigen_ode1_1000, eigen_val];
                                    end
                                elseif strcmp(method{1}, 'ode4') == 1
                                    if dt == .001
                                       max_sim_error_ode4_1(end+1) = max_error;
                                       CPU_ode4_1(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode4_1 = [eigen_ode4_1, eigen_val];
                                    elseif dt == .1
                                       max_sim_error_ode4_100(end+1) = max_error;
                                       CPU_ode4_100(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode4_100 = [eigen_ode4_100, eigen_val];
                                    else 
                                       max_sim_error_ode4_1000(end+1) = max_error;
                                       CPU_ode4_1000(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode4_1000 = [eigen_ode4_1000, eigen_val];
                                    end

                                elseif strcmp(method{1}, 'ode45') == 1
                                    if dt == .001
                                       max_sim_error_ode45_1(end+1) = max_error;
                                       CPU_ode45_1(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode45_1 = [eigen_ode45_1, eigen_val];
                                    elseif dt == .1
                                       max_sim_error_ode45_100(end+1) = max_error;
                                       CPU_ode45_100(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode45_100 = [eigen_ode45_100, eigen_val];
                                    else 
                                       max_sim_error_ode45_1000(end+1) = max_error;
                                       CPU_ode45_1000(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode45_1000 = [eigen_ode45_1000, eigen_val];
                                    end

                                elseif strcmp(method{1}, 'ode23tb') == 1
                                    if dt == .001
                                       max_sim_error_ode23tb_1(end+1) = max_error;
                                       CPU_ode23tb_1(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode23tb_1 = [eigen_ode23tb_1, eigen_val];
                                    elseif dt == .1
                                       max_sim_error_ode23tb_100(end+1) = max_error;
                                       CPU_ode23tb_100(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode23tb_100 = [eigen_ode23tb_100, eigen_val];
                                    else 
                                       max_sim_error_ode23tb_1000(end+1) = max_error;
                                       CPU_ode23tb_1000(end+1) = cpu_time;
                                       eigen_val = -b / J;
                                       eigen_ode23tb_1000 = [eigen_ode23tb_1000, eigen_val];

                                    end


                                       
                                    end

          
                                end
                              end
                            end
                        end
                    end
                end
            end
        end
