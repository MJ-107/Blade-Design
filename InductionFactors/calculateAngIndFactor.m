function aPrime = calculateAngIndFactor(nonDimensionalPoints)

aprimeValues = table2array(readtable("aprime.csv"));
valid = (nonDimensionalPoints >= 0.01) & (nonDimensionalPoints <= 1);
aPrime(valid) = interp1(aprimeValues(:,1), aprimeValues(:,2), nonDimensionalPoints(valid), 'linear', NaN);
aPrime(isnan(aPrime)) = 0.4;

end