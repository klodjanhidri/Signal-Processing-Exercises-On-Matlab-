function s = rosenmodel(N1,N2,f0,fs)
%
% s = rosenmodel(N1,N2,f0,fs)
%
% Given N1 and N2 this function computes the Rosenberg model
% of the glottal waveform for speech signals generation
% f0 is given to check if N1+N2 "fits" in a single pitch period
% At the end of the signal, N2 zeros are added to incorporate closed
% phase of the glottis
%
% Ex: s = rosenmodel(80,10,100);
%

%
% (c) Yannis Stylianou, CSD, UOC, 2003
% (update) George Kafentzis, CSD, UOC, 2015

if nargin < 4
    fs = 8000;
end

N0 = round(fs/f0);
if N0 < N1+N2
    error('You should select N1 and N2 so that N1+N2 is less than fs/f0!');
end

n1 = 0:N1;
n2 = N1:N1+N2;
s = 0.5*(1-cos(pi*n1/N1));
s = [s cos(pi*(n2-N1)/(2*N2))];
N_cp = N0 - length(s);
s = [s zeros(1,N_cp)];
