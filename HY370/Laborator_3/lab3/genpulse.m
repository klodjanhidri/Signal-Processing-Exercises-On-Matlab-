function e = genpulse(f0,d,fs)

%
%  e = genpulse(f0,d,fs)
%
% Given the fundamental frequency in Hz this function
% creates a signal of series of Kronecker functions
% with a distance of P samples between the pulses.
% P = fs/f0 where [fs] is the sampling frequency
% The total signal will have [d] seconds of duration

%
% (c) Yannis Stylianou, CSD, UOC, 2003
%

if(nargin<3)
     fs = 8000;  % default sampling frequency in Hz
end

Ln = d*fs;  % samples

e = zeros(1,Ln);
P = round(fs/f0);  % period of pulses in samples
e(1:P:Ln) = 1;
