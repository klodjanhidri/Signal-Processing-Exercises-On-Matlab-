[s,fs] = wavread('/home/klodjan/MEGA/simeiosis/HY370/Laborator_3/furelise.wav');
%soundsc(s, fs);
%gia M=1
n=2048;
A=1;
temp=zeros(1,2998);
B=[1 0.6];
[H W]=freqz(B,A,n,'whole');
mag=abs(H);
figure;plot(mag);
title('Magnitude Spectrum'); xlabel('Frequency (\omega_o)');
ph=angle(H);
figure;plot(W,ph);
title('Phase Spectrum'); xlabel('Frequency (\omega_o)');
B=[1 temp 0.6];
y=filter(B,A,s);
soundsc(y,fs);

A1=[1 0.6]; 
temp=zeros(1,2998);            
B1=1;
[H1 W1]=freqz(B1,A1,n,'whole');
mag=abs(H1);
figure;plot(mag);
title('Magnitude Spectrum Inv'); xlabel('Frequency (\omega_o)');
ph=angle(H1);
figure;plot(W1,ph);
title('Phase Spectrum Inv'); xlabel('Frequency (\omega_o)');
A1=[1 temp 0.6];
y1=filter(B1,A1,s);
soundsc(y1,fs);


r=filter(B1,A1,y);
soundsc(r,fs);