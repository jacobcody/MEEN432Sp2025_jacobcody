Howdy Nathan!

Attached are our scripts Project 4 files Proj4_track.m, 
Proj4_output, Proj4_init.m, and raceStat.m as well as our simulink Proj4_sim.slx.
After week 2 we were able to initially get the EV to run the required 5 laps, hitting 19 at one point, but now while implementing the battery
the model has not been able to run and we are still investigating the cause of the error.
This Simulink model provided attempts to implement the Electric Motor Drive (EMD) subsystem for an EV simulation.
Inputs are the Accelerator Pedal Position or APP, motor speed, and battery SOC.
For the outputs we have motor torque, battery voltage, battery current, and update SOC. 
Here we have motor torque that is determined based on the APP and RPM. 
Motor efficiency is mapped separately to adjust electrical power calculations. 
Battery voltage is found by lookop based on SOC. 
SOC updating is handled by an external modular system design. 
Make sure to initialize from the Proj4_init.m file.
