%% AME24 Competition Vehicle Initialization Script

%% Chassis Parameters
chassis.mass_lb = 510;               % Mass [lb]
chassis.mass_kg = chassis.mass_lb * 0.453592; % Convert to kg
chassis.wheelbase_in = 60;           % Wheelbase [inches]
chassis.wheelbase_m = chassis.wheelbase_in * 0.0254; % Convert to meters
chassis.weight_dist = [47 53];       % Front/Rear weight distribution [%]
chassis.CG_height_in = 11.5;         % Center of gravity height [inches]
chassis.CG_height_m = chassis.CG_height_in * 0.0254; % Convert to meters

%% Tire Parameters (Hoosier R20b 16")
% Note: Actual tire data should be loaded from CSV files
tire.max_lateral_g = 1.5;            % Estimated max lateral g-force
tire.max_longitudinal_g = 1.2;       % Estimated max longitudinal g-force
tire.slip_angle_deg = 5;             % Typical slip angle for max lateral force [deg]
tire.slip_ratio = 0.15;              % Typical slip ratio for max longitudinal force

%% Powertrain Parameters
powertrain.motor.Kt = 0.38;          % Torque constant [Nm/Arms]
powertrain.motor.Kv = 14.16;         % Speed constant [rpm/Vdc]
powertrain.motor.rpm_limit = 7000;   % Mechanical RPM limit
powertrain.motor.peak_current = 388.5; % Max AC output [Arms]

powertrain.inverter.efficiency = 0.98; % Inverter efficiency [%]
powertrain.inverter.max_power = 80;   % Estimated max power [kW]

%% Battery Parameters (140s4P Molicel P45B)
battery.cell.capacity_mAh = 4500;    % Cell capacity [mAh]
battery.cell.capacity_Ah = 4.5;      % Cell capacity [Ah]
battery.cell.voltage_nominal = 3.6;  % Nominal voltage [V]
battery.cell.voltage_max = 4.2;      % Max charge voltage [V]
battery.cell.voltage_min = 2.5;      % Min discharge voltage [V]
battery.cell.discharge_current = 45;  % Continuous discharge current [A]
battery.cell.weight_g = 70;          % Cell weight [g]
battery.cell.energy_Wh = 15.5;       % Cell energy [Wh]

battery.pack.config = '140s4p';      % Pack configuration
battery.pack.cell_count = 140*4;     % Total cell count
battery.pack.voltage_nominal = 140 * 3.6; % Nominal pack voltage [V]
battery.pack.capacity_kWh = (140*4*15.5)/1000; % Pack capacity [kWh]
battery.pack.weight_kg = (140*4*70)/1000; % Pack weight [kg]

%% Track Parameters (Example)
track.length_ft = 1000;              % Track length [ft]
track.length_m = track.length_ft * 0.3048; % Convert to meters
track.max_speed_mph = 60;            % Estimated max speed [mph]
track.max_speed_mps = track.max_speed_mph * 0.44704; % Convert to m/s


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
carData.maxAlpha = 1 / 180 * pi; %max alpha angle (rad)

%Iterative values
carData.vxd = 10; % m/s - X Velo
carData.vx_threshold1 = 0.1; % m/s - Minimum x velo

K_p = 2;
K_i = 0.8;
K_d = 0;

