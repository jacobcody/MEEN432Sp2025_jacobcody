run("Proj2_Track.m");
run("Proj2_Initialization.m");
x_cord = simout.x_vals.Data;
y_cord = simout.y_vals.Data;

% Plot the path
hLine = animatedline('Color', 'b', 'LineWidth', 3); %line that follows car will be blue, width of 3 for the line
addpoints(hLine, x_cord, y_cord);

% Car visual
w = 20;
carShape = [-2*w, -w; 2*w, -w; 2*w, w; -2*w, w];
car = patch('XData', carShape(:,1), 'YData', carShape(:,2), ...
                'EdgeColor', 'k', 'FaceColor', 'blue');

    % Update car position and orientation
for j = 1:length(x_cord)
    currentPos = [x_cord(j), y_cord(j)];
    set(car, 'XData', carShape(:,1) + currentPos(1), 'YData', carShape(:,2) + currentPos(2));
    pause(0.1); % Pause to visualize animation

end