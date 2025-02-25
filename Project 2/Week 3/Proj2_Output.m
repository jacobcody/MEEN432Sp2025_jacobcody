%run("Proj2_Track.m");
run("Proj2_Initialization.m");

xData = out.x_val.Data; %getting data from to workspace
yData = out.y_val.Data;
t = out.x_val.Time;  

rectX = -200; % track creation modeled below
rectY = 0;
rectWidth  = 1300;  
rectHeight = 400;   

inner = rectangle('Position', [rectX, rectY, rectWidth, rectHeight], ...
          'Curvature', 1, 'EdgeColor', 'k', 'LineWidth', 5);

track = rectangle('Position', [rectX, rectY, rectWidth, rectHeight], ...
          'Curvature', 1, 'EdgeColor', 'k', 'LineWidth', 10);

outer = rectangle('Position', [rectX, rectY, rectWidth, rectHeight], ...
          'Curvature', 1, 'EdgeColor', 'k', 'LineWidth', 15);

axis([-250, 1150, -250, 1150]);
title('Race Track Sim');


theta_val = zeros(1, percent_complete+1);



w = 20;
carShape = [ -2*w, -w; %creating same car patch as week 1
              2*w, -w;
              2*w,  w;
             -2*w,  w ];
initialPos = [xData(1), yData(1)];

car = patch('XData', carShape(:,1) + initialPos(1), ... %same car as week 1
            'YData', carShape(:,2) + initialPos(2), ...
            'EdgeColor', 'k', 'FaceColor', 'blue');

hLine = animatedline('Color','b','LineWidth',2);

nPoints = length(xData);
for i = 1:nPoints %coordinating current position
    addpoints(hLine, xData(i), yData(i));
    currentPos   = [xData(i), yData(i)];
    newCarShape  = carShape + currentPos;
    set(car, 'XData', newCarShape(:,1), 'YData', newCarShape(:,2));
    drawnow;
    pause(0.1);
end

%function xyt = rotate(xy, theta)
    xyt = (TF(theta) * xy')';
%end

%function y_rotate = TF(psi)
    y_rotate = [ cos(psi), -sin(psi);
            sin(psi),  cos(psi) ];
%end


%theta value is created from dy/dx. need to create something to calculate
%that