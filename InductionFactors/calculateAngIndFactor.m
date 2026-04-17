function aprime = calculateAngIndFactor(nonDimensionalPoints)

aprimeValues = table2array(readtable("aprime.csv"));
valid = (nonDimensionalPoints >= 0.01) & (nonDimensionalPoints <= 1);
aprime(valid) = interp1(aprimeValues(:,1), aprimeValues(:,2), nonDimensionalPoints(valid), 'linear', NaN);
aprime(isnan(aprime)) = 0.4;

end