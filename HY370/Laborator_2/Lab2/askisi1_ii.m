
No = 5;
N = 15;
x1 = 3 * cos(2*pi*(-7:7)/No);
figure(1); stem(-7:7, x1); xlabel('Time (samples');
fx1 = fft(x1, N);
mag = abs(fx1);
ph = angle(fx1);
omega = 2*pi*(0:N-1)./N;
figure(2);
subplot(211); stem(omega, mag);
title('Magnitude Spectrum'); xlabel('Frequency (\omega_k)');
subplot(212); stem(omega, ph);
title('Phase Spectrum'); xlabel('Frequency (\omega_k)');

 

No = 5;
x1 = 3 * cos(2*pi*(-7:7)/No);
N = 99;
fx1 = fft(x1, N);
mag = abs(fx1);
ph = angle(fx1);
omega = 2*pi*(0:N-1)./N;
figure(3);
subplot(211); stem(omega, mag);
title('Magnitude Spectrum of N=99'); xlabel('Frequency (\omega_k)');
subplot(212); stem(omega, ph);
title('Phase Spectrum N=99'); xlabel('Frequency (\omega_k)');


