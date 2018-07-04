function h = makeFB(fr)
%
% it creates a bank of band pass filters. Each filter
% has 40 Hz of bandwidth.
% Filters are centered at frequencies specified by fr
%
% For instance: DTMF standard:
%   h = makeFB([697 770 852 941 1209 1336 1477]);
%
% Y. Stylianou (c) UOC, CSD, 2003
% G. Kafentzis (c) UOC, CSD, 2012 (upd)

% Sampling frequency
fs = 8000;

% Cutoff frequency of lowpass filter (in Hz)
fc = 20;

% Length of the input vector
L = length(fr);

% Create 201 samples of filter data
n = (-100:100)';

% allocation of memory
h = zeros(length(n), L);


% basic low-pass filter

% Store in hlp the time domain equation of the lowpass filter
% Use "sinc" function and vector "n" above
hlp = % INSERT CODE HERE

% Create the bandpass filters
for i = 1:L
	% Store in h(:,i) the i-th bandpass filter of frequency fr(i)
	h(:,i) = % INSERT CODE HERE
	% Divide your filter by the sum of its coefficients
	h(:,i) = % INSERT CODE HERE
end
