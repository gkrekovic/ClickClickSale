% Author: Gordan Krekovi?
% Created: 2015-08-08

function [retval] = determineamplitude(network)
  if (network == 2)
    retval = 0.2;
   else
    retval = 0.5 + network / 5;
   end
end
