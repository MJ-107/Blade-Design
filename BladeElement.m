classdef BladeElement
    
    properties
        r1
        r2
        elementLength
        numStns
        cntlPnt
        
    end
    
    methods
        function obj = BladeElement(r2, elementLength, numStns)
            obj.r2 = r2;
            obj.r1 = r2-elementLength;
            obj.elementLength = elementLength;
            obj.numStns = numStns;
            obj.cntlPnt = (obj.r1 + obj.r2) / 2;
        end
    end
end

