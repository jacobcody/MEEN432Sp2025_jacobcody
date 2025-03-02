function wk1_runsim()
Time = evalin('base', 'Time');
sname = "Project_3_wk1";
open_system(sname);
sim_config = getActiveConfigSet(sname);
set_param(sim_config, 'StopTime', num2str(Time(end)));
simout = sim(sname);
assignin('base', 'sim_vel', simout.vel.Data);
assignin('base', 'sim_time', simout.tout);
end