Part 1 Notes: 

For Part 1, please open the P1.m matlab script file to run the iterations and simulations, the Project1_Part1_Model_current.slx simulink file, and finally, the graphing_proj1.m matlab script in order to produce the plots. You should  run the script iteration file with the corresponding simulink file open first. These simulations may take a few minutes from our experience. Then, once the simulation file has completed its run, you can then switch to the plotting file which should use the values populated into the workspace in order to produce plots and display values. Some of the issues we encountered in coding this project was insufficient time to implement the "try catch" loop and the use of RK4, DT= .001 for the theoretical values of the sinusodal torque inputs. In our code, there is a spot where we planned to implement the calculation for the theoretical omega based off of the RK4 simulation. 

Part 2 Notes:

For this portion of the code, the script files are Part2_Option1_Code.m, Part2_Option2_Code.m, and Part2_Option3_Code.m . The Simulink Files are Project1_Option1_Stiffness.slx, Project1_Option2_Combined.slx, and Project1_Option3.slx

Explanation of errors: Part 2 remains unchanged from our initial submission on 2/1/24. We prioritized finishing Project 2 part 1 and fixing Project 1, part 1 to the best of our abilities, and because of this ran out of time to correct part 2 based on our new part 1 files. Upon running the script, it is apparent due to the time needed to complete the running of the file and the response from the simulink window, that they are iterating together. However, upon numerous tests, we were never able to see the to workspace files produced by the simulink in the script workspace which lets us know it was not actually storing the data from all of the simulations in the workspace. So the plot produced, if produced, is just the last simulation run in the actual simulink window. We tried, but were never successful in getting adequate cooperation between the two.

Additionally, in the Simulink for Option 3, we had consistent issues with the torque input file. The torque subsystem was the same as used in the other 2 simulink files, but was not compatible with this one which led to issues we were unable to debug.

Final Notes:

Thank you for looking through this. We understand the project did not come together to the standard in which we were hoping for, but we belive we were extremely close to an adequate final solution that we put representative effort in for, and we hope this reflects in the foundations of our work.
