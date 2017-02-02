% Author: Gordan Krekovi?
% Created: 2015-08-07

function [retval] = makewindow (conn, len, typ)
  if (typ == 0)
    if strcmp(strtrim(conn), 'Unknown')
     retval = hanning(len);
   elseif strcmp(strtrim(conn), 'Mobile')
     retval = bartlett(len);
   else
    retval = [linspace(0, 1, 16) linspace(1, 0.2, len/2-16) linspace(0.2, 0, len/2)]';
   end
  else
     if strcmp(strtrim(conn), 'Unknown')
        retval = [linspace(0, 1, 16) linspace(1, 0.2, len/4) linspace(0.2, 0, 3*len/4-16)]';
     else
        retval = hanning(len);
     end
  end
end
