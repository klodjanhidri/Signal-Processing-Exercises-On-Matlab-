
[s,fs] = wavread('/home/klodjan/simeiosis/HY370/Laborator_2/4781_8k.wav');
soundsc(s, fs);
[n m]=size(s);
omega0=2*pi*400/fs;

%
A=1;
B=[1 -exp(1i*omega0)];
[H W]=freqz(B,A);
mag=abs(H);
figure;plot(mag);
title('Magnitude Spectrum'); xlabel('Frequency (\omega_o)');
ph=angle(H);
figure;plot(W,ph);
title('Phase Spectrum'); xlabel('Frequency (\omega_o)');

%erwtima ii vrika y[n]=delta[n]-2*delta[n-1]cos(w)-d[n-2]
%opote A ,B
A3=1;
B3=[1 -2*cos(omega0) 1];
[H2 W2]=freqz(B3,A3,n);
y2=filter(B3,A3,s);
soundsc(y2,fs);

mag=abs(H1);
ph1=angle(H1);
figure;plot(mag);title('Magnitude Spectrum y[n]=delta[n]-2*delta[n-1]cos(w)-d[n-2] '); xlabel('Frequency (\omega_o)');
figure;plot(W1,ph1);title('Phase Spectrum y[n]=delta[n]-2*delta[n-1]cos(w)-d[n-2]'); xlabel('Frequency (\omega_o)');



%y[n]-2αcos(ω0)y[n − 1]+a2y[n − 2]=x[n]−2cos(ω0)x[n−1]+x[n − 2]
a=0.8;
A1=[1 -2*a*cos(omega0) a*a];
B2=[1 -2*cos(omega0) 1];
[H1 W1]=freqz(B2,A1,n);
y1=filter(B2,A1,s);
soundsc(y1,fs);

mag=abs(H1);
ph1=angle(H1);
figure;plot(mag);
title('Magnitude Spectrum y[n]-2αcos(ω0)y[n − 1]+a2y[n − 2]=x[n]−2cos(ω0)x[n−1]+x[n − 2]');
xlabel('Frequency (\omega_o)');
figure;plot(W1,ph1);
title('Phase Spectrum y[n]-2αcos(ω0)y[n − 1]+a2y[n − 2]=x[n]−2cos(ω0)x[n−1]+x[n − 2]');
xlabel('Frequency (\omega_o)');
