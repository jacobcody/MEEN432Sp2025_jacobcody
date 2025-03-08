function wk1_runsim()
Time = evalin('base', 'Time');
sim_file = "Project_3_Week_1";
open_system(sim_file);
sim_config = getActiveConfigSet(sim_file);
set_param(sim_config, 'StopTime', num2str(Time(end)));
simout = sim(sim_file);
assignin('base', 'sim_vel', simout.vel.Data);
assignin('base', 'sim_time', simout.tout);
end
