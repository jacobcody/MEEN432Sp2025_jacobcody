Howdy! 

For Project 1 Part 1, download the Project1_Part1_Code.m and Project1_Part1_Model.slx files. Open up both of them and run the simulink model first. This is to sync the model and code. After running the simulink model, run the code and observe the plots. 

(Note, if there's any error codes that pop up when syncing the Simulink model, try re-syncing the model again. Typically, syncing the model, followed by the code, and then resyncing the model and code again resolves any errors)

Each set of plots is a different combination of time steps and integration methods. Since there's 2 integrations methods (Euler and Runge Kutta), as well as 3 different time steps (0.001 seconds, 0.1 seconds, and 1 second), there will be 5 sets of graphs. 





Additionally, there are plots showing:

-Max simulation Error vs time step, for the different
fixed time step Integration methods

-CPU Time taken vs time step, for the different fixed
time step integration method

-Max simulation Error vs CPU Time taken for the
simulation, for each of the different integration
methods (both fixed time step and variable time step)

(Note, we were unable to complete the contour plots, but they'll be added by the project deadline.)

-Contour plots of constant system eigen values with
Max Sim Error on y axis and CPU time on x axis.

-Contour plots of constant input frequencies with Max
Sim Error on y axis and CPU time on x axis.
 
