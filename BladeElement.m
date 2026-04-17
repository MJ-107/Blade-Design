classdef BladeElement
    
    properties
        r1
        r2
        elementLength
        numStns
        cntlPnt
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

        function obj = calculateTwist(obj, windSpeed, rotationalSpeed, axialInductionFactor)
            obj.TSR = (obj.r2 * rotationalSpeed) / windSpeed; % R2 being used because planform is being generated
            obj.resVelocity = sqrt(windSpeed*(1-axialInductionFactor));
       
            
        end
    end
end

