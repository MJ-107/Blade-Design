% Macie Orrell
% BEMT Blade Planform Solver + Performance Mapping
% =========================================================================

%% Initalize script

close all
clear all
clc

%% Initialize blade elements

run inputs.m

dr = rotor.R/rotor.numStns;
a = 1/3;

for i = 1:1:rotor.numStns
BladeElements(i) = BladeElement(dr*i, rotor.elementLength, rotor.numStns);
BladeElements(i) = calculateTwist(BladeElements, rotor.R, wf.WindSpeed, rotor.rotationalSpeed, a);
end

% General notes
% Redo the a' data