## Author: Gordan Kreković
## Created: 2015-08-07

function [retval] = makesignal (network, aff, adv, operator, model, len, fs, typ)
  fc = 120 * log(mod(sum(toascii(operator)), 80)+1)*2^(1/7); %% bilo je 140
  fm = aff/adv*fc;
  B = sum(toascii(model)) / 1500; %% bilo je 1000
  if typ == 0
    retval = sin(2*pi*fc*(1:len)/fs + B*sin(2*pi*fm*(1:len)/fs))';
  else
    B = sum(toascii(model)) / 1500;
    env = [linspace(0, 1, 16) linspace(1, 0.2, len/4) linspace(0.2, 0.1, 3*len/4-16)];
    retval = sin(2*pi*fc*(1:len)/fs + B* env .* sin(2*pi*fm*(1:len)/fs))';
  end
end