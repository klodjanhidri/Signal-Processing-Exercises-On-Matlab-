arithmiti=conv([1 -1.25*exp(j*pi/4)], [1 -1.25*exp(-j*pi/4)]);
paranomasti=conv([1 -0.97*exp(j*3*pi/4)], [1 -0.97*exp(-j*3*pi/4)]);

pezw2(arithmiti,paranomasti);

[s,fs] = wavread('/home/klodjan/MEGA/simeiosis/HY370/Laborator_4/sampleLab4.wav');
soundsc(s, fs);


arithmiti=conv([25/16 -(5/4)*exp(j*pi/4)], [25/16 -(5/4)*exp(-j*pi/4)]);
paranomasti=conv([1 -0.97*exp(j*3*pi/4)], [1 -0.97*exp(-j*3*pi/4)]);

pezw2(arithmiti,paranomasti);
pezw2(paranomasti,arithmiti);


A=[25/16 (-1.25*exp(j*pi/4)-1.25*exp(-j*pi/4)) 1];
B=[1 (-0.97*exp(j*3*pi/4)-0.97*exp(-j*3*pi/4)) 0.97*0.97];

y=filter(B,A,s);
figure;plot(y);
soundsc(y,fs);