## Author: Gordan Kreković
## Created: 2015-08-07

clear

%% Constants

% Duration of the composition in seconds
duration = 180;

% Sampling frequency
fs = 44100;

% Number of channels
ch = 2;

% Duration of the time period of the data set in seconds
dataduration = 86400;

piece = makecloud("AFS_raw_clicks.csv", duration, fs, ch, dataduration, 0);
% piece = makecloud("AFS_raw_conversions.csv", duration, fs, ch, dataduration, 1);

maxsample = max(max(piece(:, :)));

% Export each channel to a separate wave file
for i = 1:ch
  wavwrite(piece(:, i) / maxsample, fs, 16, ["clks" int2str(i) ".wav"]);
end
