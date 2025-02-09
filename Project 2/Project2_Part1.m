rectX = -200; % track creation modeled below
rectY = 0;
rectWidth  = 1300;  
rectHeight = 400;   

rectangle('Position', [rectX, rectY, rectWidth, rectHeight], ...
          'Curvature', 1, 'EdgeColor', 'k', 'LineWidth', 15);

axis([-250, 1150, -250, 1150]);
title('Race Track Sim');

track_length = 900;   % Length of a straight segment
track_radial = 200;   % Circular parts of track
track_width  = 15;   % Width of track
percent_complete = 100; % Used to track where car is relative to origin

x_cord = zeros(1, percent_complete);
y_cord = zeros(1, percent_complete);
theta_val = zeros(1, percent_complete+1);


seg1 = 1:25; % straight segment
seg2 = 26:50; % curve #1
seg3 = 51:75; % straight segment
seg4 = 76:100; % curve #2

% Segment #1
x_cord(seg1) = (track_length / 25) * seg1;
y_cord(seg1) = 0;

% Segment #2
deltaTheta2 = (180 / 25) * (seg2 - 25) + 270;
theta_val(seg2) = deltaTheta2 - 270;  
x_cord(seg2) = track_length + track_radial * cosd(deltaTheta2);
y_cord(seg2) = track_radial + track_radial * sind(deltaTheta2);

% Segment #3
x_cord(seg3) = (track_length / 25) .* (50 - seg3) + track_length;
y_cord(seg3) = 400;

% Segment #4
deltaTheta4 = (180 / 25) * (seg4 - 75) + 90;
theta_val(seg4) = deltaTheta4 - 90;
x_cord(seg4) = track_radial * cosd(deltaTheta4);
y_cord(seg4) = track_radial + track_radial * sind(deltaTheta4);


x_cord = [0, x_cord]; %end at origin
y_cord = [0, y_cord]; %end at origin
      
hLine = animatedline('Color', 'b', 'LineWidth', 3); %line that follows car will be blue, width of 3 for the line

w = 20;
carShape = [ -2*w, -w; 
              2*w, -w;
              2*w,  w;
             -2*w,  w ];

car = patch('XData', carShape(:,1), 'YData', carShape(:,2), ...
                 'EdgeColor', 'k', 'FaceColor', 'blue');


total_complete = 100;
for j = 1:100
    addpoints(hLine, x_cord(j), y_cord(j)); %coordinating position with animation line
    currentPos = [x_cord(j), y_cord(j)]; %current positon
    
    if j == 1
        newCarShape = carShape + currentPos; %this'll rotate the car
    else
        angleRad = deg2rad(theta_val(j));
        newCarShape = rotate(carShape, angleRad) + currentPos;
    end

    set(car, 'XData', newCarShape(:,1), 'YData', newCarShape(:,2));

    pause(0.1); %doeesn't immediately start the car to give time for the graph to upload
end

% both of the functions below model the car rectangle rotating through the track
% takes the position of the car and rotates it

function xyt = rotate(xy, theta)
    xyt = (TF(theta) * xy')';
end

function y = TF(psi)
    y = [cos(psi), -sin(psi); sin(psi), cos(psi)];
end
