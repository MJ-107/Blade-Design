classdef BladeElement
    
    properties
        R
        IncrementLength
        r
    end
    
    methods
        function obj = BladeElement(R, IncrementLength)
            obj.R = R;
            obj.IncrementLength = IncrementLength;

            n = floor(obj.R / obj.IncrementLength);
            for i = 1:1:n
                obj.r(i) = BladeElement((i-1)*obj.IncrementLength);
            end 
        end
    end
end

