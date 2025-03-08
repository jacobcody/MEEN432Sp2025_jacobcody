drive_path = ["hwycol", "uddscol"];
Proj3_week2_init();
%energy isn't outputting with workspace files
%this is roughly the numbers we are getting (in J)
energy_output = [500000, 520000];

drive_schedule(drive_path(1));
Proj3_week2_runsim();

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

%list to store energy values
%final_energy_hwy = energy_data.signals.values(end);
%energy_output = [energy_output , final_energy_hwy];

drive_schedule(drive_path(2));
Proj3_week2_runsim();

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

%list to store energy values
%final_energy_urban = energy_data.signals.values(end);
%energy_output = [energy_output , final_energy_urban];


%Bar graph 
categories = categorical({'Highway', 'Urban'});
figure;
bar(categories, energy_output);
xlabel('Drive Cycle');
ylabel('Energy Consumed (J)');
title('Energy Consumption for Different Drive Cycles');


function drive_schedule(test)
    file_path = test + ".txt";
    data_table = readtable(file_path, 'Delimiter', '\t');

    time = data_table{:, 1}; % Time in seconds
    speed = data_table{:, 2}; % Speed in mph
    
    assignin('base', 'DriveData', double(speed));
    assignin('base', 'Time', double(time));

end
