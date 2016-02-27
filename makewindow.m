## Copyright (C) 2015 gkrekovic
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} makewindow (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: gkrekovic <gkrekovic@NTH-HR-ZG-0463>
## Created: 2015-08-07

function [retval] = makewindow (conn, len, typ)
  if (typ == 0)
    if strcmp(strtrim(conn), "Unknown")
     retval = hanning(len);
   elseif strcmp(strtrim(conn), "Mobile")
     retval = bartlett(len);
   else
    retval = [linspace(0, 1, 16) linspace(1, 0.2, len/2-16) linspace(0.2, 0, len/2)]';
   end
  else
     if strcmp(strtrim(conn), "Unknown")
        retval = [linspace(0, 1, 16) linspace(1, 0.2, len/4) linspace(0.2, 0, 3*len/4-16)]';
     else
        retval = hanning(len);
     end
  end
end
