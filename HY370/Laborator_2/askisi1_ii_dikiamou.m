N=15;
n=15;
omega = 2*pi*(0:N-1)./N;
pp=(omega-2*pi/5);
j=1;
for i=-n:n

    for l=1:N
    x(j)=pp(2) +2*pi*i;
    xx(j)=KronD(x(j),0);
    %j=j+1;
    end
    x(j)=pp(2) +2*pi*i;
    xx2(j)=KronD(x(j),0);
    j=j+1;
end

x2(1:n)=pp(1:n) +2*pi*1;
stem(omega,x2)

%xx(j)=KronD(,0);

a=15*pi/5-omega;
b=(2*pi/5-omega)/2;
c=(j*28*pi/5)/2;

aa=15*pi/5+omega;
bb=(2*pi/5+omega)/2;
cc=(-j*28*pi/5)/2;

%v=3*exp(c).*(sin(a)./sin(b))+exp(cc).*3*(sin(aa)./sin(bb));
%v(4)=15;

a1=(1-exp(16*j*(2*pi/5-omega)))./(1-exp(j*(2*pi/5-omega)));
b1=(1-exp(16*-j*(2*pi/5+omega)))./(1-exp(j*(2*pi/5+omega)));
a1(4)=22.5;
v=3/2*a1+3/2*b1;

mag = abs(v);
ph = angle(v);

figure(2);
subplot(211); stem(omega, mag);
title('Magnitude Spectrum '); xlabel('Frequency (\omega_k)');
subplot(212); stem(omega, ph);
title('Phase Spectrum'); xlabel('Frequency (\omega_k)');





