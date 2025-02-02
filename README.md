Howdy! 

For Project 1 Part 1, download the Project1_Part1_Code_revision.m and Project1_Part1_Model.slx files. Open up both of them and run the simulink model first. This is to sync the model and code. After running the simulink model, run the code and observe the plots. 

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

Notes for part1:

In order to fix the error between running the script, simulation, script try using the load simulation method in your script after you initial values are initialized.

Part 2 Notes:

For this portion of the code, every file is labeled part 2 with an associated option number with both a Matlab Script file and a Simulink file. If you open each associated file, run the script first, then the Simulink, then the script again, it should produce some angular velocity plots. 

Explanation of errors: Due to errors in Part 1, our part 2 also suffered. Upon running the script, it is apparent due to the time needed to complete the running of the file and the response from the simulink window, that they are iterating together. However, upon hours of testing, we were never able to see the to workspace files produced by the simulink in the script workspace which lets us know it was not actually storing the data from all of the simulations in the workspace. So the plot produced, if produced, is just the last simulation run in the actual simulink window. We tried, but were never successful in getting adequate cooperation between the two.

Additionally, in the Simulink for Option 3, we had consistent issues with the torque input file. The torque subsystem was the same as used in the other 2 simulink files, but was not compatible with this one which led to issues we were unable to debug. 

Final Notes:

Thank you for looking through this. We understand the project did not come together to the standard in which we were hoping for, but we belive we were extremely close to an adequate final solution that we put representative effort in for, and we hope this reflects in the foundations of our work. 
