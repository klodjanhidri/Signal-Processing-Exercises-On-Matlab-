hann=transpose(hanning(101));

x1 = cos(pi/4*(0:100)).*hann;
x2 = cos(2*pi/4*(0:100)).*hann;
x = [x1 x2 zeros(1,200)];
plot(x);

r=0.7;

a=exp(-j*pi/4)-r*exp(j*pi/4);
b=1-r*exp(j*pi/4)*exp(-j*pi/4);
[gd w]=grpdelay(b,a);
