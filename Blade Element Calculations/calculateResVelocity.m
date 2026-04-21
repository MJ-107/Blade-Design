function VR= calculateResVelocity(POI, windSpeed, rotationalSpeed, ...
    axInductionFactor, angInductionFactor)

VR = sqrt((windSpeed * (1 - axInductionFactor)) ^ 2 + ...
    (POI * rotationalSpeed * (1 + angInductionFactor)) ^ 2);
end

