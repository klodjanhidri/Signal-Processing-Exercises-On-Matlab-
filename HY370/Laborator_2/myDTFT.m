function [mag, ph, w] = myDTFT(x, NFFT)
% Implementation of DTFT
%
% Input:
%       x   [1xL] signal to analyze
%      NFFT [1x1] number of discrete frequencies for the DFT (optional)
%                 default = 2048
%
%       mag [1xNFFT] magnitude spectrum
%        ph [1xNFFT] phase spectrum
%        w  [1xNFFT] frequency vector
%
% Usage: x = (1/5)*ones(1,5);
%        myDTFT(x); % plots the spectra
% or 
%        [mag, ph, w] = myDTFT(x);
%
% George Kafentzis, CSD, UoC, 2015

if nargin < 2
    NFFT = 2048;
end

MF = fft(x, NFFT);

w = 2*pi*(0:NFFT-1)./NFFT;
mag = abs(MF);
ph = angle(MF);

subplot(211); plot(w, mag); 
title('Magnitude Spectrum'); xlabel('Omega (rad/sample)'); ylabel('Magnitude');
subplot(212); plot(w, ph); 
title('Phase Spectrum'); xlabel('Omega (rad/sample)'); ylabel('Radians');