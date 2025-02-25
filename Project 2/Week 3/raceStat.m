clear; clc;
run('Proj2_Initialization.m');
simOut = sim('Project2_sim.slx'); 

% Data from the simulation
xData = simOut.x_val.Data;  
yData = simOut.y_val.Data; 
t = simOut.x_val.Time;     

% Define track parameters
track.radius = 200; 
track.width = 15;   
track.l_straightaways = 900; 

% Finding the track length
track_length = 2 * pi * track.radius + 2 * track.l_straightaways;

% Calculating the total distance traveled
distance_traveled = sum(sqrt(diff(xData).^2 + diff(yData).^2));

% Number of laps calculations
num_laps = floor(distance_traveled / track_length);

% Determine completion time
completion_time = t(end) - t(1);

% track boundary checks
out_of_track = false;
for i = 1:length(xData)
    radial_distance = sqrt(xData(i)^2 + yData(i)^2);
    inner_bound = track.radius - (track.width / 2);
    outer_bound = track.radius + (track.width / 2);
    if radial_distance < inner_bound || radial_distance > outer_bound
        out_of_track = true;
        break; 
    end
end

% Display results
disp('Race Stats:');
fprintf('Total Laps Completed: %d\n', num_laps);
fprintf('Completion Time: %.2f seconds\n', completion_time);
if out_of_track
    disp('Warning: The vehicle went out of track boundaries!');
else
    disp('The vehicle stayed within track limits.');
end

