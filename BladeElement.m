classdef BladeElement
    
    properties
        r1
        r2
        elementLength
        numStns
        cntlPnt
        nonDimensionalizedPoint
        angInductionFactor
        TSR 
        resVelocity
        
    end
    
    methods
        function obj = BladeElement(r2, elementLength, numStns)
            obj.r2 = r2;
            obj.r1 = r2-elementLength;
            obj.elementLength = elementLength;
            obj.numStns = numStns;
            obj.cntlPnt = (obj.r1 + obj.r2) / 2;
        end

        function obj = calculateTwist(obj, R, windSpeed, rotationalSpeed, axInductionFactor)
            obj.nonDimensionalizedPoint = nonDimensionalize(obj.r2, R); % R2 being used because planform is being generated
            obj.angInductionFactor = calculateAngIndFactor(obj.nonDimensionalizedPoint);
            obj.TSR = (obj.r2 * rotationalSpeed) / windSpeed; 
            obj.resVelocity = sqrt((windSpeed * (1 - axInductionFactor)) ^ 2 + ...
                (obj.r2 * rotationalSpeed * (1 + obj.angInductionFactor)) ^ 2);
        end


    end
end

