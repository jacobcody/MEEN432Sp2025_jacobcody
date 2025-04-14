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



