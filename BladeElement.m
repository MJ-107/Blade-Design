classdef BladeElement
    
    properties
        Property1
    end
    
    methods
        function obj = BladeElement(inputArg1,inputArg2)
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            outputArg = obj.Property1 + inputArg;
        end
    end
end

