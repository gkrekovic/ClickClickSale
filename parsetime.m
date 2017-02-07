% Author: Gordan Krekovi?
% Created: 2015-08-07

function [retval] = parsetime (tstemp)
  t = datetime(tstemp, 'Format', 'yyyy-MM-dd HH:mm:ss.000');
  retval = posixtime(t);
end
