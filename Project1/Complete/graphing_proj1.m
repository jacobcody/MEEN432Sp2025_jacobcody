fig1 = figure;
hold on;

sim_fixed_1 = plot(time_steps, [max(max_sim_error_ode1_1) max(max_sim_error_ode1_100) max(max_sim_error_ode1_1000)], '-*', ...
    'LineWidth', 1, 'MarkerSize', 5, 'Color', 'b'); 
sim_fixed_2 = plot(time_steps, [max(max_sim_error_ode45_1) max(max_sim_error_ode45_100) max(max_sim_error_ode45_1000)], '-*', ...
    'LineWidth', 1, 'MarkerSize', 5, 'Color', 'r'); 
xlabel('Time Step (s)');  
ylabel('Max Sim Error (seconds)');
title('Max Sim Error vs Time Step for Fixed Time Step Integration Methods');
grid on;
legend([sim_fixed_1 sim_fixed_2], {'Euler (ode1)', 'Runge Kutta 4th Order (ode4)'}, 'Location', 'northwest');

fig2 = figure;
hold on;

cpu_fixed_1 = plot(time_steps, [max(CPU_ode1_1) max(CPU_ode1_100) max(CPU_ode1_1000)], '-*', ...
    'LineWidth', 1, 'MarkerSize', 5, 'Color', 'b'); 
cpu_fixed_2 = plot(time_steps, [max(CPU_ode45_1) max(CPU_ode45_100) max(CPU_ode45_1000)], '-*', ...
    'LineWidth', 1, 'MarkerSize', 5, 'Color', 'r'); 
xlabel('Time Step (s)');  
ylabel('CPU Time (seconds)');
title('CPU Time vs Time Step for Fixed Time Step Integration Methods');
grid on;
legend([cpu_fixed_1 cpu_fixed_2], {'Euler (ode1)', 'Runge Kutta 4th Order (ode4)'}, 'Location', 'northwest');


fig3 = figure;
hold on;

sim_cpu_1 = plot([max(CPU_ode1_1) max(CPU_ode1_100) max(CPU_ode1_1000)], [max(max_sim_error_ode1_1) max(max_sim_error_ode1_100) max(max_sim_error_ode1_1000)], '-*', ...
    'LineWidth', 1, 'MarkerSize', 5, 'Color', 'b'); 
sim_cpu_2 = plot([max(CPU_ode45_1) max(CPU_ode45_100) max(CPU_ode45_1000)], [max(max_sim_error_ode45_1) max(max_sim_error_ode45_100) max(max_sim_error_ode45_1000)], '-*', ...
    'LineWidth', 1, 'MarkerSize', 5, 'Color', 'r'); 
xlabel('CPU Error (s)');  
ylabel('Max Sim Error (seconds)');
title('Max Sim Error vs CPU Error for Fixed Time Step and Variable Time Step Integration Methods');
grid on;
legend([sim_cpu_1 sim_cpu_2], {'Euler (ode1)', 'Runge Kutta 4th Order (ode4)'}, 'Location', 'northwest');

