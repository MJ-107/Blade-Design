% Macie Orrell
% BEMT Blade Planform Solver + Performance Mapping
% =========================================================================

%% User inputs for rotor
% *** Input values in this section ***
rotor.numBlades = 3; % Input desired number of blades
rotor.R = 1; % Input total rotor radius in m
rotor.numStns = 11; % Input number of blade stations
rotor.TSR = 7.5; % Input rotor tip speed ratio

%% User inputs for working fluid
wf.WindSpeed = 10; % Input free stream velocity in m/s
% wf.Altitude % need to add lookup function to get air properties for calcs

%% Additional set up calculations
% *** DO NOT ALTER FORMULAS ***
rotor.stnCntrlPnt = linspace(0, rotor.R, rotor.numStns);
rotor.Area = pi * rotor.R ^ 2; % Swept area of rotor
rotor.RotationalSpeed = (rotor.TSR * wf.WindSpeed) / rotor.R ; % In rad/s
wf.Density = 1.225; 
wf.KinematicVisc = 1.789e-5; % Std air
wf.AvailablePower =  1/2 * wf.Density * rotor.Area * wf.WindSpeed ^ 3;


