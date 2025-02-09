Howdy!

For Project 2 Part 1, download the Project2_Part1.m file and run it on MATLAB. The code creates a track on a graph and 4 different segments. The dimensions of this graph are based on the given parameters of a 900-meter straightaway and a 200-meter radius on circular turns. The 4 include 2 straight paths and 2 circular turns. For straight segments, x-coordinates increase while y-coordinates remain the same. For curved segments, it calculates the position of the car based on cosine and sine functions. A rectangular block represents a car, along with an animated blue line following its path, and drives around this track. During the test, the position and orientation of the car are updated using a transformation matrix. This ensures that the animation of the car provides smooth turns throughout the circular parts of the track.

TA Notes:

1. ReadME is sufficient. Add more on how the code works depending on the vehicle kinematic aspect.
2. Simulink needed(Week1 exempted but going forward for Week2 is necessary)
3. Implementation of Vd = R/Psi(dot) not visible. Do this before moving forward of implementing dynamics to code.
4. Generate Track should have the track, innertrack, and outertrack. Do not just make the width of the line 15.
