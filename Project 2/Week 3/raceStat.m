% racestat.m - Script to analyze race performance
% Determines number of loops completed, completion time, and track boundary validation

clear; clc;

% Ensure all parameters are initialized before running simulation
run('Proj2_Initialization_Marshall.m');  % Load carData and other necessary variables

% Run the Simulink model
simOut = sim('Project2_sim.slx'); % Ensure "To Workspace" blocks exist

% Extract data from simulation output
xData = simOut.x_val.Data; % X-coordinates from Simulink
yData = simOut.y_val.Data; % Y-coordinates from Simulink
t = simOut.x_val.Time;     % Time vector from Simulink

% Define track parameters
track.radius = 200; % Radius of Curves
track.width = 15;   % Width of the Track
track.l_straightaways = 900; % Length of Straightaways

% Compute total track length (approximate)
track_length = 2 * pi * track.radius + 2 * track.l_straightaways;

% Compute total distance traveled
distance_traveled = sum(sqrt(diff(xData).^2 + diff(yData).^2));

% Calculate number of laps completed
num_laps = floor(distance_traveled / track_length);

% Determine completion time
completion_time = t(end) - t(1);

% Check if the vehicle stays within track boundaries
out_of_track = false;
for i = 1:length(xData)
    % Compute radial distance from track center (assuming centered at origin)
    radial_distance = sqrt(xData(i)^2 + yData(i)^2);
    
    % Define track limits based on width
    inner_bound = track.radius - (track.width / 2);
    outer_bound = track.radius + (track.width / 2);
    
    % Check if the vehicle goes out of bounds
    if radial_distance < inner_bound || radial_distance > outer_bound
        out_of_track = true;
        break; % No need to continue checking
    end
end

% Display results
disp('Race Statistics:');
fprintf('Total Laps Completed: %d\n', num_laps);
fprintf('Completion Time: %.2f seconds\n', completion_time);
if out_of_track
    disp('Warning: The vehicle went out of track boundaries!');
else
    disp('The vehicle stayed within track limits.');
end
