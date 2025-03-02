routines = ["hwycol", "uddscol"];
wk1_init();
set_routine(routines(1));
wk1_runsim();


figure;
plot(sim_time, sim_vel*(1/mph2mps), 'b') % Remember, drive cycles are mph
hold on
plot(Time, DriveData, '--r') 
plot(Time, (DriveData)+3, '--k') 
plot(Time, (DriveData)-3, '--k') 
xlabel("Time (s)")
ylabel("Velocity (mph)") 
legend("Sim Velocity", "Drive Cycle Velocity") % , "3 mph Error Band")
title("Simulated Vehicle Velocity vs Time for "+ routines(1))

set_routine(routines(2));
wk1_runsim();

figure;
plot(sim_time, sim_vel*(1/mph2mps), 'b') % Remember, drive cycles are mph
hold on
plot(Time, DriveData, '--r') 
plot(Time, (DriveData)+3, '--k') 
plot(Time, (DriveData)-3, '--k') 
xlabel("Time (s)")
ylabel("Velocity (mph)") 
legend("Sim Velocity", "Drive Cycle Velocity") % , "3 mph Error Band")
title("Simulated Vehicle Velocity vs Time for "+ routines(2))



function set_routine(test)
    file_path = test + ".txt";
    data_table = readtable(file_path, 'Delimiter', '\t');

    % Extract the numeric data
    time = data_table{:, 1}; % Time in seconds
    speed = data_table{:, 2}; % Speed in mph
    
    assignin('base', 'DriveData', double(speed));
    assignin('base', 'Time', double(time));

end
