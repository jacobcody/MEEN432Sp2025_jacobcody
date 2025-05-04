rectX = -200; % track creation modeled below
rectY = 0;
rectWidth  = 1300;  
rectHeight = 400;   

inner = rectangle('Position', [-192.5, 7.5, 1285, 385], ...
          'Curvature', 1, 'EdgeColor', 'k', 'LineWidth', 2.5);

track = rectangle('Position', [rectX, rectY, rectWidth, rectHeight], ...
          'Curvature', 1, 'EdgeColor', 'r', 'LineWidth', 1.5, 'LineStyle', '--');

outer = rectangle('Position', [-207.5, -7.5, 1315, 415], ...
          'Curvature', 1, 'EdgeColor', 'k', 'LineWidth', 2.5);

axis([-250, 1150, -250, 1150]);
title('Race Track Sim');

% Track centerline length for elevation mapping
trackLength = 2*pi*200 + 2*900;  % Total track length

% Create arc length parameter s
s_res = 0.5; % resolution (meters)
s_vals = 0:s_res:trackLength;

% Define elevation: 0 to +10 m on 1st straightaway, +10 to 0 on 2nd
elevation_profile = zeros(size(s_vals));
straight_len = 900;
trackradius=200;

for i = 1:length(s_vals)
    s = mod(s_vals(i), trackLength);
    if s < straight_len  % 1st straightaway (0 to 900 m)
        elevation_profile(i) = 10 * (s / straight_len);
    elseif s > (straight_len + pi * trackradius) && s < (2 * straight_len + pi * trackradius)
        % 2nd straightaway (back down)
        delta_s = s - (straight_len + pi * trackradius);
        elevation_profile(i) = 10 * (1 - delta_s / straight_len);
    else
        elevation_profile(i) = 10; % flat top during the curve
    end
end

% Save as lookup for simulation use
track_elevation_s = s_vals;
track_elevation_z = elevation_profile;
save('track_elevation.mat', 'track_elevation_s', 'track_elevation_z');

