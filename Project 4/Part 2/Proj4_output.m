clear;
run("Proj4_track.m");
run("Proj4_init.m");
sim("Proj4_sim.slx",1000)
run('raceStat.m')

xData = simOut.x_val.Data; %getting data from to workspace
yData = simOut.y_val.Data;
t = simOut.x_val.Time;  

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
% attempt to solve issue pertaining to lack of rotation for the patch
function xyt = rotate(xy, theta)
    xyt = (TF(theta) * xy')';
end

function y_rotate = TF(psi)
    y_rotate = [ cos(psi), -sin(psi);
            sin(psi),  cos(psi) ];
end


%theta value is created from dy/dx. need to create something to calculate
%that
