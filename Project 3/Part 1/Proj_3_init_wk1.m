drive_path = ["hwycol", "uddscol"];
wk1_init();
drive_schedule(drive_path(1));
wk1_runsim();

figure;
plot(sim_time, sim_vel*(1/mph2mps), 'b') %want to display this as mph
hold on
plot(Time, DriveData, '--r') 
plot(Time, (DriveData)+3, '--k') 
plot(Time, (DriveData)-3, '--k') 
xlabel("Time (s)")
ylabel("Velocity (mph)") 
legend("Sim Velocity", "Drive Cycle Velocity", "3 mph error band");
title("Simulated Vehicle Velocity vs Time for "+ drive_path(1))

drive_schedule(drive_path(2));
wk1_runsim();

figure;
plot(sim_time, sim_vel*(1/mph2mps), 'b') %drive cycle is in mph
hold on
plot(Time, DriveData, '--r') 
plot(Time, (DriveData)+3, '--k') 
plot(Time, (DriveData)-3, '--k') 
xlabel("Time (s)")
ylabel("Velocity (mph)") 
legend("Sim Velocity", "Drive Cycle Velocity", "3 mph error band");
title("Simulated Vehicle Velocity vs Time for "+ drive_path(2))



function drive_schedule(test)
    file_path = test + ".txt";
    data_table = readtable(file_path, 'Delimiter', '\t');

    time = data_table{:, 1}; % Time in seconds
    speed = data_table{:, 2}; % Speed in mph
    
    assignin('base', 'DriveData', double(speed));
    assignin('base', 'Time', double(time));

end
