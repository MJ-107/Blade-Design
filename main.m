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

isCtrl = 0;

% Calculate Twist Angle

    for i = 1:1:rotor.numStns
        BladeElements(i) = BladeElement(dr*i, rotor.elementLength, rotor.numStns);
        BladeElements(i) = calculateaPrime(BladeElements(i), isCtrl, rotor.R);
        BladeElements(i) = calculateTSR(BladeElements(i), isCtrl, rotor.rotationalSpeed, wf.WindSpeed);
        BladeElements(i) = calculateVR(BladeElements(i), isCtrl, rotor.rotationalSpeed, wf.WindSpeed, a);

%BladeElements(i) = calculatePhi(BladeElements(i), rotor.R, wf.WindSpeed, rotor.rotationalSpeed, a);
    end



% General notes
% Redo the a' data