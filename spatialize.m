% Author: Gordan Krekovi?
% Created: 2015-08-08

function [retval] = spatialize (country, ch)
  retval = zeros(ch, 1);
  rloc = 0;
  philoc = 0;
  
  if strcmp(strtrim(country), 'UNITED STATES')
    rloc = normrnd(3*pi/4, pi/4);
    philoc = min([1 normrnd(0.7, 0.2)]);
  elseif strcmp(strtrim(country), 'CANADA')
    rloc = normrnd(pi/2, pi/10);
    philoc = min([1 normrnd(0.9, 0.1)]);
  elseif strcmp(strtrim(country), 'AUSTRALIA')
    rloc = normrnd(15*pi/8, pi/7);
    philoc = min([1 normrnd(0.6, 0.3)]);
  elseif strcmp(strtrim(country), 'NEW ZEALAND')
    rloc = normrnd(7*pi/8, pi/9);
    philoc = min([1 normrnd(0.9, 0.1)]);
  elseif strcmp(strtrim(country), 'CHINA')
    rloc = normrnd(0, pi/6);
    philoc = min([1 normrnd(0.8, 0.3)]);
  elseif strcmp(strtrim(country), 'JAPAN')
    rloc = normrnd(pi/9, pi/10);
    philoc = min([1 normrnd(0.9, 0.1)]);
  elseif strcmp(strtrim(country), 'UNITED KINGDOM')
    rloc = normrnd(3*pi/8, pi/10);
    philoc = min([1 normrnd(0.6, 0.3)]);
  else
    rloc = rand(1,1)*2*pi;
    philoc = rand(1,1);  
  end
  
  for i=0:ch-1
    rs = 1;
    phis = 2*i*pi/ch;
    retval(i+1, 1) = sqrt(rs*rs + rloc*rloc - 2*rs*rloc*cos(phis-philoc));
  end
end
