run("Proj4_track.m");
run("P4_Init.m");
simOut = sim("Proj4_sim.slx",1000);
run('raceStat.m');

xData = simOut.x_val.Data;
yData = simOut.y_val.Data;
t = simOut.x_val.Time;

w = 10;
carShape = [ -2*w, -w;
              2*w, -w;
              2*w,  w;
             -2*w,  w ];
initialPos = [xData(1), yData(1)];

car = patch('XData', carShape(:,1) + initialPos(1), ...
            'YData', carShape(:,2) + initialPos(2), ...
            'EdgeColor', 'k', 'FaceColor', 'blue');

hLine = animatedline('Color','b','LineWidth',2);

nPoints = length(xData);

for i = 1:nPoints
    currentX = xData(i);
    currentY = yData(i);

    if i == 1
        heading = 0; 
    else
        dx = xData(i) - xData(i-1);
        dy = yData(i) - yData(i-1);
        heading = atan2(dy, dx);
    end

    rotatedCarShape = rotate(carShape, heading);

    %Update animation
    addpoints(hLine, currentX, currentY);
    newCarShape = rotatedCarShape + [currentX, currentY];
    set(car, 'XData', newCarShape(:,1), 'YData', newCarShape(:,2));
    drawnow;
    pause(0.1);
end

%Rotation
function xyt = rotate(xy, theta)
    xyt = (TF(theta) * xy')';
end

function y_rotate = TF(psi)
    y_rotate = [ cos(psi), -sin(psi);
                 sin(psi),  cos(psi) ];
end
