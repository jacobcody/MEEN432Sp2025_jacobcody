Howdy Nathan!

Attached are our scripts Project 4 files Proj4_track.m, 
Proj4_output, Proj4_init.m, and raceStat.m as well as our simulink Proj4_sim.slx. Begin with downloading all the files and running the Proj4_output file to get results.

The purpose of this model is to combine lateral and longitudinal dynamics into a comprehensive EV model. This Simulink model provided attempts to implement the Electric Motor Drive (EMD) subsystem for an EV simulation. Inputs are the Accelerator Pedal Position or APP, motor speed, and battery SOC.
For the outputs we have motor torque, battery voltage, battery current, and update SOC. Here we have motor torque that is determined based on the APP and RPM. 
Motor efficiency is mapped separately to adjust electrical power calculations and battery voltage is found through a lookup table based on SOC. 
SOC updating is handled by an external modular system design. 

The car follows all of the required as outlined by Project 4 such as 100% fricton braking if the car is under 5 mph, a SOC between 10%-95%, and a friction braking percentage that drops linearly to 5% at 25 mph.
For future work, we would continue to iterate through the PID controls for the 2 controllers in the Racer model and would review components of the electric motor drive subsystem.
