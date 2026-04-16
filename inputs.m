% Macie Orrell
% BEMT Blade Planform Solver + Performance Mapping
% =========================================================================

%% User inputs for rotor
% *** Input values in this section ***
rotor.numBlades = 3; % Input desired number of blades
rotor.R = 1; % Input total rotor radius in m
rotor.numCntrlPnts = 10; % Input desired number of cntrl points for calculations
rotor.TSR = 7.5; % Input rotor tip speed ratio

%% User inputs for working fluid
wf.WindSpeed = 10; % Input free stream velocity in m/s
% wf.Altitude % need to add lookup function to get air properties for calcs

%% Additional set up calculations
% *** DO NOT ALTER FORMULAS ***
rotor.stnEdges = linspace(0, rotor.R, rotor.numCntrlPnts+1);
rotor.CntrlPntDist = (rotor.stnEdges(1:end-1) + rotor.stnEdges(2:end))/2;
rotor.Area = pi * rotor.R ^ 2; % Swept area
rotor.RotationalSpeed = (rotor.TSR * wf.WindSpeed) / rotor.R ; % In rad/s
wf.Density = 1.225; 
wf.KinematicVisc = 1.789e-5; % Std air
wf.AvailablePower =  1/2 * wf.Density * rotor.Area * wf.WindSpeed ^ 3;


