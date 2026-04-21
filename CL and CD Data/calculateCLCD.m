function [CL,CD] = calculateCLCD(directory, alpha, Re)

% List all files in the directory
LookUpTables = dir(directory); 

% If no lookup files are found, display error
if isempty(LookUpTables)
        error('No files found in the selected directory.');
end

% Get Reynolds number boundary

% Initialize loop
TableIndex = [];

% Get boundaries
for i = 3:1:length(LookUpTables)
    % Pull out filename, turn to string and remove file extension
    names(i-2,:) = str2double(split(LookUpTables(i,:).name,"."));
end

names = names(:,1); % Remove column 2 of NaN's
LookUpTables = sortrows(names(:,1)); % Sort in numerical order

i = 1;

while isempty(TableIndex) && (i+1 <= length(LookUpTables))
    ReLow = LookUpTables(i);
    ReHigh = LookUpTables(i+1);

    if ReLow < Re && ReHigh >= Re
        TableIndex = i;
    end

    i = i+1;
end

% Check if lookup tables are out of bounds
if isempty(TableIndex)
    error('Reynolds number %.2e is out of bounds of available lookup tables.', Re);
end

% Reads in from low Reynolds number table 
% (column 1 -> alpha, column 2 -> cl)
ReadTableLow = table2array(readtable(strcat(directory,num2str(LookUpTables(TableIndex)),".csv")));
CLLow = interp1(ReadTableLow(:,1),ReadTableLow(:,2),alpha);
CDLow = interp1(ReadTableLow(:,1),ReadTableLow(:,3),alpha);

% Reads in from high Reynolds number table 
% (column 1 -> alpha, column 2 -> cl)
ReadTableHigh = table2array(readtable(strcat(directory,num2str(LookUpTables(TableIndex+1)),".csv")));
CLHigh = interp1(ReadTableHigh(:,1),ReadTableHigh(:,2),alpha);
CDHigh = interp1(ReadTableHigh(:,1),ReadTableHigh(:,3),alpha);

% Interpolate between table high and table low (Re to get cl)
% (column 1 -> alpha, column 2 -> cl)
CL = (((CLHigh-CLLow)/(ReHigh-ReLow))*(Re-ReLow))+CLLow;
CD = (((CDHigh-CDLow)/(ReHigh-ReLow))*(Re-ReLow))+CDLow;

end