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



