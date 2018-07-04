function pezw(B,A)
%
% pezw(B,A)
%
% PEZW(B,A) plots the zeros and poles (with the unit circle for reference), 
% the magnitude and phase spectrum of the system, and the impulse response 
% h[n] (the first 100 samples)
% 
% B and A are polyonomials in z: 
%  B(z): vector containing the coefficients of numerator in descending
%  order of z^-1
%  A(z): vector containing the coefficients of denominator in descending
%  order of z^-1
%
%  Example: for signal H(z) = 1/(1-0.4z^-1), call pezw(1, [1 -0.4]);
%
% (c) Yannis Stylianou, CSD, UOC, 2003
% (c) (update) G. Kafentzis, CSD, UOC, 2015

figure;
warning('off');
subplot(231);
zplane(B,A);
[H,w]=freqz(B,A,256,'whole');
w = w-pi;
H=[H(129:256);H(1:128)];
subplot(232);
plot(w,abs(H));
v = axis;
axis([w(1) w(256) v(3:4)]);
title('Magnitude');xlabel('Frequency (rad/sample)');

subplot(234);
plot(w,angle(H));
v = axis;
axis([w(1) w(256) v(3:4)]);
title('Phase'); xlabel('Frequency (rad/sample)');
subplot(233);
[h,t]=impz(B,A,100);
stem(t,h);
title('Impulse Resp.');
xlabel('Samples');

subplot(2,3,5:6);
num_pts = 46;
upplus = 2;
[B1,A1] = eqtflength(B,A);
[z,p,~] = tf2zp(B1,A1);
mn = min([-1.2; real([z; p]); imag([z;p])]);
mx = max([1.2; real([z; p]); imag([z;p])]);
[x,y] = meshgrid(linspace(mn,mx,num_pts),linspace(mn,mx,num_pts));
z = x+1i*y;
ce = exp(-1i*2*pi*(0:.001:1));
cevals = abs(polyval(B,ce)./polyval(A,ce));
vals = polyval(B(end:-1:1),1./z)./polyval(A(end:-1:1),1./z);
vals(abs(vals) > max(cevals)+upplus) = max(cevals)+upplus;
mesh(x,y,abs(vals));
axis tight;
h = line(real(ce),imag(ce),cevals + 0.01);
set(h,'Color',[1 0 0]);
set(h,'LineWidth',2);
h = line(real(ce),imag(ce),cevals - 0.01);
set(h,'Color',[1 0 0]);
set(h,'LineWidth',2);
xlabel('Real(z)');
ylabel('Imag(z)');
zlabel('|H(z)|');
title('Magnitude of function H(z)');
