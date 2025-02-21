carData.Inertia = 1600; %inertia in kg/m^2
carData.Mass = 1000; %car mass in kg
carData.init.X0 = 0; %initial x position of car (m)
carData.init.Y0 = 0; %initial y position of car (m)
carData.init.vx0 = 0.1; %initial x velocity of car (m)
carData.init.vy0 = 0;   %initial y velocity of car (m)
carData.init.omega0 = 0; %initial yaw rate (rad/s)
carData.init.psi0 = 0;   %initial yaw angle (rad)

%Set parameters for the car

carData.Calpha_f = 40000; %front tire coefficient (N/rad)
carData.Calpha_r = 40000; %rear tire coefficient (N/rad)
carData.Fyfmax = 40000*1/180*pi; %max front tire force (N)
carData.Fyrmax = 40000*1/180*pi; %max rear tire force (N)
carData.lr = 1.5; %distance from center of car to rear axis
carData.lf = 1.0; %distance from center of car to rear axis
carData.radius = 0.3; %radius of tires (m)
carData.maxAlpha = 4 / 180 * pi; %max alpha angle (rad)

%Iterative values
carData.vxd = 3; % m/s - X Velo
carData.vx_threshold1 = 0.1; % m/s - Minimum x velo

K_p = 2;
K_i = 0;
K_d = 0;

