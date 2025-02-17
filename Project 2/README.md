Howdy!

For Project 2 Part 1, download the Project2_Part1.m file and run it on MATLAB. The code creates a track on a graph and 4 different segments. The dimensions of this graph are based on the given parameters of a 900-meter straightaway and a 200-meter radius on circular turns. The 4 include 2 straight paths and 2 circular turns. For straight segments, x-coordinates increase while y-coordinates remain the same. For curved segments, it calculates the position of the car based on cosine and sine functions. A rectangular block represents a car, along with an animated blue line following its path, and drives around this track. During the test, the position and orientation of the car are updated using a transformation matrix. This ensures that the animation of the car provides smooth turns throughout the circular parts of the track.

For Part 2,

TA Notes (Part 1):

1. ReadME is sufficient. Add more on how the code works depending on the vehicle kinematic aspect.
2. Simulink needed(Week1 exempted but going forward for Week2 is necessary)
3. Implementation of Vd = R/Psi(dot) not visible. Do this before moving forward of implementing dynamics to code.
4. Generate Track should have the track, innertrack, and outertrack. Do not just make the width of the line 15.


WEEK 2

For Project 2, Week 2, open the Matlab file named Project2_Part2_code.m and the Simulink file named Project2_Part2_sim.slx. Run the Matlab code to initialize the workspace for the Simulink to read from, then run the Simulink where the XY plot should populate with our car's path (we had plots produced in a circle, but right before the deadline had 1 variable change which caused the plotting to stop working). What our simulink is doing is starting with the initial values given by the Matlab script, first running them through our Driver Subsystem which uses geometry and the coordinates to determine where on the track it is and what the look-ahead value (phi_d) should be. This look-ahead value is then run through a PID controller to be analyzed for the error and then plugged into the function to acquire delta_f, the angle of the front wheels. From here, the model takes this angle and the velocity in the defined x-direction to determine the lateral dynamics of the vehicle through the calculation of Tire Slip and Tire Force. This lateral dynamic function then calculates the acceleration in the y-direction and omega_dot which is integrated to find psi, which is the angle at which the car is moving. The simulink then complies the x-direction velocity, y-direction velocity, and psi to translate it into X and Y coordinates which are then plotted on the XY plot and plugged back into the beginning of the process to repeat as the car proceeds around the track. 

Note: We found a bug in our simulink that didn't allow the plot to generate. The new simulink has been posted with Project2_Part2_sim_UPDATED.

TA Notes Week2:
1. Organize Github by weekly deliverables.
2. Where is your simulation? (Should have been completed in Week1).
3. Simulation cannot finish compiling even with the new uploaded version.
4. XY graph is generated yet insufficient, car should begin at (0,0) and end at (0,0).
