% Macie Orrell
% BEMT Blade Planform Solver + Performance Mapping
% =========================================================================

%% User inputs for rotor
% *** Input values in this section ***
rotor.numBlades = 3; % Input desired number of blades
rotor.R = 1; % Input total rotor radius in m
rotor.elementLength = 0.1; % Length in m
rotor.TSR = 7.5; % Input rotor tip speed ratio

%% User inputs for working fluid
wf.WindSpeed = 10; % Input free stream velocity in m/s
% wf.opAltitude % need to add lookup function to get air properties for calcs

%% Additional set up calculations
% *** DO NOT ALTER FORMULAS ***
rotor.Area = pi * rotor.R ^ 2; % Swept area
rotor.RotationalSpeed = (rotor.TSR * wf.WindSpeed) / rotor.R ; % In rad/s
rotor.numStns = rotor.R/rotor.elementLength;
wf.Density = 1.225; 
wf.KinematicVisc = 1.789e-5; % Std air
wf.AvailablePower =  1/2 * wf.Density * rotor.Area * wf.WindSpeed ^ 3;


