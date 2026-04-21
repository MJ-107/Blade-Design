classdef BladeElement
    
    properties
        r1 % LE of element
        r2 % TE of element
        elementLength
        numStns
        POI double = 0;% User input flag: 0 = TE, 1 = Cntrl
        ctrlPnt % Center of element
        nonDimensionalizedPoint
        aPrime
        TSR 
        VR
        Phi
        
    end
    
    methods

        function obj = BladeElement(r2, elementLength, numStns)
            obj.r2 = r2;
            obj.r1 = r2-elementLength;
            obj.elementLength = elementLength;
            obj.numStns = numStns;
            obj.ctrlPnt = (obj.r1 + obj.r2) / 2;
        end

        function POI = checkCenter(obj, isCtrl)
            % Set POI to endpoints or midpoints of every element
                if isCtrl == 0
                    POI = obj.r2; % Set to endpoints (TE)
                    
                else
                    POI = obj.ctrlPnt; % Set to midpoints (ctrl points)
                    
                end
        end

        function obj = calculateaPrime(obj, isCtrl, R)
            obj.POI = checkCenter(obj, isCtrl);
            obj.nonDimensionalizedPoint = nonDimensionalize(obj.POI, R);
            obj.aPrime = calculateAngIndFactor(obj.nonDimensionalizedPoint);
        end

        function obj = calculateTSR(obj, isCtrl, rotationalSpeed, windSpeed)
            obj.POI = checkCenter(obj, isCtrl);
            obj.TSR = calculateTipSpeedRatio(obj.POI, rotationalSpeed, windSpeed);
        end

        function obj = calculateVR(obj, isCtrl, rotationalSpeed, windSpeed, a)
            obj.POI = checkCenter(obj, isCtrl);
            obj.VR = calculateResVelocity(obj.POI, windSpeed, rotationalSpeed, a, obj.aPrime);
        end


        %     obj.resVelocity = calculateResVelocity(obj.r2);
        %     obj.inFlowAngle  = calculatePhi
        % end


    end
end

