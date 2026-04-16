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
% *** Do not alter formualas ***
rotor.stnCntrlPnt = linspace(0, rotor.R, rotor.numStns);
wf.Density = 1.225; 
wf.KinematicVisc = 1.789e-5; % Std air


