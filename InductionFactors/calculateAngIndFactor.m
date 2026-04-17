function [aprime] = calculateAngIndFactor(nonDimensionalPoints)

aprimeValues = table2array(readtable("aprime.csv")); 

end


% Only for x in the range [0.05, 1]. Outside this range, returns NaN.

    % Initialize output
    aprime = NaN(size(nondimensionalmidpoints));  % Supports scalar or vector input

    % Logical index for valid x values
    valid = (nondimensionalmidpoints >= 0.01) & (nondimensionalmidpoints <= 1);
    
    % Read in table for tangential induction factor
    aprime_all_points = table2array(readtable("aprime.csv")); 

    % Interpolate 
    aprime(valid) = interp1(aprime_all_points(:,1), aprime_all_points(:,2), nondimensionalmidpoints(valid), 'linear', NaN);

    % If NaN, change to the max a' value, 0.4

    aprime(isnan(aprime)) = 0.4;