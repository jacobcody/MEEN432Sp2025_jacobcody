Time = evalin('base', 'Time');
sim_file = "Proj3_week3_sim";
open_system(sim_file);
sim_config = getActiveConfigSet(sim_file);
set_param(sim_config, 'StopTime', num2str(Time(end)));
simout = sim(sim_file);
assignin('base', 'sim_vel', simout.vel.Data);
assignin('base', 'sim_time', simout.tout);