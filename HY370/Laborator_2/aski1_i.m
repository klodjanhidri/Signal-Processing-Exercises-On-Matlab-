%erwtima β ,γ
N1=5;
N2=30;
x1=ones(1,N1);
x2=ones(1,N2);
X1 = fft(x1, N1);
X2 = fft(x2, N2);

NFFT = N1;
omega = 2*pi*(0:NFFT-1)./NFFT;
mag = abs(X1);
ph = angle(X1);
figure; stem(omega, mag);
title('Magnitude Spectrum X1'); xlabel('Frequency (\omega_k)');
figure; stem(omega, ph);
title('Phase Spectrum X1'); xlabel('Frequency (\omega_k)');


NFFT = N2;
omega = 2*pi*(0:NFFT-1)./NFFT;
mag2 = abs(X2);
ph = angle(X2);
figure; stem(omega, mag2);
title('Magnitude Spectrum X2'); xlabel('Frequency (\omega_k)');
figure; stem(omega, ph);
title('Phase Spectrum X2'); xlabel('Frequency (\omega_k)');

%erwtima ε 

N1=25;
N2=26;
X1 = fft(x1, N1);
X2 = fft(x1, N2);
NFFT = N1;
omega = 2*pi*(0:NFFT-1)./NFFT;
mag25 = abs(X1);
ph25 = angle(X1);
figure; stem(omega, mag25);
title('Magnitude Spectrum Χ1=25'); xlabel('Frequency (\omega_k)');
figure; stem(omega, ph25);
title('Phase Spectrum Χ1=25'); xlabel('Frequency (\omega_k)');
NFFT = N2;
omega = 2*pi*(0:NFFT-1)./NFFT;
mag26 = abs(X2);
ph26 = angle(X2);
figure; stem(omega, mag26);
title('Magnitude Spectrum X2=26'); xlabel('Frequency (\omega_k)');
figure; stem(omega, ph26);
title('Phase Spectrum X2=26'); xlabel('Frequency (\omega_k)');

%askisi_1 ζ) ερωτηση
mag25(1:10)
ph25(1:10)

mag26(1:10)
ph26(1:10)



%erwtisi η) 

xx1 = real(ifft(X1));
figure;stem(0:24, xx1);
title('Antintsrofo Fourier Transform fX1=25');

%erwtisi ι)

N = 25;
w = 2*pi/N;
lp = 2;
wn = lp*w*(0:N-1);
xx1 = real(ifft(X1 .* exp(j*wn)));
figure;stem(0:24, xx1);
title('Antintsrofo Fourier Transform  fX1 erwtima i');

N = 26;
w = 2*pi/N;
lp = 2;
wn1 = lp*w*(0:N-1);
xx2 = real(ifft(X2 .* exp(j*wn1)));
figure;stem(0:25, xx2);
title('Antintsrofo Fourier Transform X2 erwtima i');


