Howdy!

To begin, download the  hwycol.txt and uddscol.txt files. These are the 2 epa cycles we used in our testing. Additionally, download the Project_3_Week_1.slx, wk1_init.m, and wk1_runsin.m, and Proj_3_init_wk1.m files. Run the Proj_3_init_wk1.m file to obtain results.

The goal of this week was to create a longitudinal model that simulated 2 different EPA cycles within a 3 mph error. To begin, the desired speed was captured through text files and inputted into the system. The simulated speed of the system was calculated using a driver model, brakes, power terrain, wheel, and vehicle subsystems. The simulated and desired speed are sebnt through a PID controller to minimize the error. We iterated through different values of proportional gain, with a gain of 0.4 giving us results that stayed within the 3 mph margin of error. 
