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

isCtrl = 0; % 0 for end points, 1 for cntrl points

%% Calculate Twist Angle

% Precurser calcs a', TSR, VR, Phi for every element
    for i = 1:1:rotor.numStns
        BladeElements(i) = BladeElement(dr*i, rotor.elementLength, rotor.numStns);
        BladeElements(i) = calculateaPrime(BladeElements(i), isCtrl, rotor.R);
        BladeElements(i) = calculateTSR(BladeElements(i), isCtrl, rotor.rotationalSpeed, wf.WindSpeed);
        BladeElements(i) = calculateVR(BladeElements(i), isCtrl, rotor.rotationalSpeed, wf.WindSpeed, a);
        BladeElements(i) = calculatePhi(BladeElements(i), isCtrl);
    end

 % Set idx depedning on if endpoints or ctrl points are POI
    if isCtrl == 0
        idx = 2;

        else
            idx = 1;
    end

 alpha = BladeElements(end).Phi(idx);

 % Calculate twist angle
    for i = 1:1:rotor.numStns
        BladeElements(i) = calculateTheta(BladeElements(i), isCtrl, alpha);
    end

 %% Calculate element chord, torque

% General notes
% Redo the a' data