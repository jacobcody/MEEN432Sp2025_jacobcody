
%Data from sim
xData = simOut.x_val.Data;  
yData = simOut.y_val.Data; 
t = simOut.x_val.Time;     

%Track creation
trackradius = 200; 
trackwidth = 15;   
trackl_straightaways = 900; 

%Length of track
track_length = 2 * pi * trackradius + 2 * trackl_straightaways;

%Distance based on length
distance_traveled = sum(sqrt(diff(xData).^2 + diff(yData).^2));

%Laps
num_laps = floor(distance_traveled / track_length);

%Completion time
completion_time = t(end) - t(1);

%Out of bounds checks
out_of_track = false;
for i = 1:length(xData)
    radial_distance = sqrt(xData(i)^2 + yData(i)^2);
    inner_bound = trackradius - (trackwidth / 2);
    outer_bound = trackradius + (trackwidth / 2);
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

