## Author: Gordan Kreković
## Created: 2015-08-07

function [retval] = parsetime (tstemp)
  s = strsplit(tstemp, '.');
  tm_struct = strptime(s{1}, '%Y-%m-%d %T');
  retval = mktime(tm_struct);
end
