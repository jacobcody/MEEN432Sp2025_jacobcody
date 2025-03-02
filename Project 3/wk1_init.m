function wk1_init()
% Recommended Initial values for Project 3 
C0 = 0.0041;         %in N
C1 = 0.000066;       %in N/(m/s)

% parameters for calculation of C2
Rho =1.225;          %Kg/m^3
A  = 2.32;           % m^2 (projected area)
Cd = 0.36;           %Aerodynamic drag coefficient
C2 = 0.5*Rho*A*Cd;

%Other vehicle parameters
M=1000;              %kg(Mass of vehicle)
L=3;                 %m(wheelbase)
h=0.6;               %m(CG height)
ha=0.80;             %m(aerodynamic force action point height)
b= 1.6;              %m(distance of CG from front axle).
r = 0.36;
Iw = 0.5*7*(r^2);
FDG = 2.5;

%  Torque Converter Data
engineInertia = 0.1;
k_factor = [135  135  140 148  160 175  190 250  500];
sr =       [0    0.2  0.4 0.6  0.8 0.85 0.9 0.95 1  ];
tr =       [2.25 1.95 1.7 1.35 1.1 1.0  1.0 1.0  0  ];
TC_Inertia_In = 0.0001;
TC_Inertia_Out = 0.0001;

% Conversion
mph2mps = 1600/3600;


% Assigning variables to the MATLAB workspace
assignin('base', 'C0', C0);
assignin('base', 'C1', C1);
assignin('base', 'Rho', Rho);
assignin('base', 'A', A);
assignin('base', 'Cd', Cd);
assignin('base', 'C2', C2);
assignin('base', 'M', M);
assignin('base', 'L', L);
assignin('base', 'h', h);
assignin('base', 'ha', ha);
assignin('base', 'b', b);
assignin('base', 'r', r);
assignin('base', 'Iw', Iw);
assignin('base', 'FDG', FDG);
assignin('base', 'engineInertia', engineInertia);
assignin('base', 'k_factor', k_factor);
assignin('base', 'sr', sr);
assignin('base', 'tr', tr);
assignin('base', 'TC_Inertia_In', TC_Inertia_In);
assignin('base', 'TC_Inertia_Out', TC_Inertia_Out);
assignin('base', 'mph2mps', mph2mps);
end