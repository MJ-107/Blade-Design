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
        Theta
        
    end
    
    methods

        function obj = BladeElement(r2, elementLength, numStns)
            obj.r2 = r2;
            obj.r1 = r2-elementLength;
            obj.elementLength = elementLength;
            obj.numStns = numStns;
            obj.ctrlPnt = (obj.r1 + obj.r2) / 2;
        end

        function [POI,idx] = checkCenter(obj, isCtrl)
            % Set POI to endpoints or midpoints of every element
                if isCtrl == 0
                    POI = obj.r2; % Set to endpoints (TE)
                    idx = 2;
                else
                    POI = obj.ctrlPnt; % Set to midpoints (ctrl points)
                    idx = 1;
                end
        end

        function obj = calculateaPrime(obj, isCtrl, R)
            [obj.POI,idx] = checkCenter(obj, isCtrl);
            obj.nonDimensionalizedPoint(idx) = nonDimensionalize(obj.POI, R);
            obj.aPrime(idx) = calculateAngIndFactor(obj.nonDimensionalizedPoint(idx));
        end

        function obj = calculateTSR(obj, isCtrl, rotationalSpeed, windSpeed)
            [obj.POI,idx] = checkCenter(obj, isCtrl);
            obj.TSR(idx) = calculateTipSpeedRatio(obj.POI, rotationalSpeed, windSpeed);
        end

        function obj = calculateVR(obj, isCtrl, rotationalSpeed, windSpeed, a)
            [obj.POI, idx] = checkCenter(obj, isCtrl);
            obj.VR(idx) = calculateResVelocity(obj.POI, windSpeed, rotationalSpeed, a, obj.aPrime(idx));
        end

        function obj = calculatePhi(obj, isCtrl)
            [obj.POI, idx] = checkCenter(obj, isCtrl);
            obj.Phi(idx) = calculateInflowAngle(obj.POI, obj.TSR(idx));
        end


        function obj = calculateTheta(obj, isCtrl, alpha)
            [obj.POI, idx] = checkCenter(obj, isCtrl);
            obj.Theta(idx) = calculateTwist(obj.Phi(idx), alpha);
        end


    end
end

