%[z,p,k] = ellip(1,,30,200/500);

z=[-0.7 zeros(1,9) 1];
p=[1 zeros(1,9) -0.7];
figure;title('a=0.7  Highpass Digital Filter');
zplane(z,p);

z1=[0.7 zeros(1,9) 1];
p1=[1 zeros(1,9) 0.7];
figure;title('a=-0.7  Highpass Digital Filter');
zplane(z,p);

[s,fs] = wavread('/home/klodjan/MEGA/simeiosis/HY370/Laborator_5/Music.wav');
soundsc(s, fs);

z2=[-0.8 zeros(1,999) 1];
p2=[1 zeros(1,999) -0.8];

z3=[-0.7 zeros(1,2499) 1];
p3=[1 zeros(1,2499) -0.7];

y=filter(z2,p2,s);
y1=filter(z3,p3,y);
soundsc(y1,fs);
