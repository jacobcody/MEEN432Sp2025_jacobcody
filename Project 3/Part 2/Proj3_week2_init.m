C0 = 0.001;         %in N (these are just set values)
C1 = 0.001;       %in N/(m/s)

% parameters for calculation of C2 - Tesla Model X
Rho =1.225;          %Kg/m^3
A  = 2.7;           % m^2 (projected area of Tesla)
Cd = 0.24;           %Aerodynamic drag coefficient
C2 = 0.5*Rho*A*Cd;

%Vehicle stats for a Tesla Model X

M=2352; %car mass in kg
L=2.96; %distance between front and rear axles
h=0.6;  %CG height in m, no exact distance is known so this is an estimate
ha=0.80; %m(aerodynamic force action point height)
r = 0.254; %radius of wheel
Iw = 0.5*25*(r^2); %assuming 25 kg per tire

%conversion factor
mph2mps = 0.447;

%gear ratio from Tesla's website
%note that we're using the front gear ratio, the back one is 9.74

GR = 9.34;

%max torque from Tesla's website for the Model X
max_torque = 967;


% Assigning variables to workspace
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
assignin('base', 'r', r);
assignin('base', 'Iw', Iw);
