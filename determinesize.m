% Author: Gordan Krekovi?
% Created: 2015-08-07

function [retval] = determinesize (network, fs, typ)
  if (typ == 0)
    len = 2^network * fs * 0.03;  %% bilo je 0.04
  else
     len = network * fs * 0.8;
  end
  retval = 2^round(log2(len));
end
