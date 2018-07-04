N1=5;
N2=30;
x1=ones(1,N1);
x2=ones(1,N2);
j=sqrt(-1);

NFFT = N1;
omega = 2*pi*(0:NFFT-1)./NFFT;
fderiv = @(f,x) (f(x+eps)-f(x))/eps;    % Derivative of a function
xderiv =@(f,x) (f(x+eps)-f(x))/eps;     % Derivative of a function
for n = 1:N1
    x1(n)= exp(-2*j*omega(n))*(sin(5.*(omega(n)/2))/sin(omega(n)*0.5));
    if isnan(x1(n))% Test for ‘NaN’
        x1(n) =exp(-2*j*omega(n))*((fderiv(@sin, omega(n)/2)*5)/(xderiv(@sin,omega(n)/2)));      % L'Hospital's Rule
    end
end
x1=roundn(x1,-3);
mag=abs(x1);
ph1=angle(x1);
figure; stem(omega, mag);
title('Magnitude Spectrum Diko mou X1'); xlabel('Frequency (\omega_k)');

figure; stem(omega,ph1);
title('Phase Spectrum Diki mou X1'); xlabel('Frequency (\omega_k)');

omega = 2*pi*(0:N2-1)./N2;
%fderiv = @(f,x) (f(x+eps)-f(x))/eps;    % Derivative of a function
%xderiv =@(f,x) (f(x+eps)-f(x))/eps;     % Derivative of a function
for n = 1:N2
    a=( 30*omega(n)*0.5);
    bb=(omega(n)*0.5);
    
    x22(n)= exp(-28*j*omega(n))*(sin(a)/sin(bb));
    if isnan(x22(n))% Test for ‘NaN’
     x22(n) =exp(-28*j*omega(n))*((fderiv(@sin, omega(n)/2)*5)./(xderiv(@sin,omega(n)/2)));      % L'Hospital's Rule
   end
end

x22=roundn(x22,-3);
mag1=abs(x22);
ph1=angle(x22);
figure; stem(omega,mag1);
title('Magnitude Spectrum Diko mou X2'); xlabel('Frequency (\omega_k)');
figure; stem(omega,ph1);
title('Phase Spectrum Diki mou X2'); xlabel('Frequency (\omega_k)');


%dikia mou ilopoiisi gia to erwtima ε)

omega1 = 2*pi*(0:25-1)./25;
fderiv = @(f,x) (f(x+eps)-f(x))/eps;    % Derivative of a function
xderiv =@(f,x) (f(x+eps)-f(x))/eps;     % Derivative of a function
i=1;
for n = 1:25
    a=( 5*omega1(n)*0.5);
    bb=(omega1(n)*0.5);
    
    xx1(n)= exp(-2*j*omega1(n))*(sin(a)/sin(bb));
    
    
    if isnan(xx1(n))% Test for ‘NaN’
      xx1(n) =exp(-2*j*omega1(n))*((fderiv(@sin, omega1(n)/2)*5)./(xderiv(@sin,omega1(n)/2)));      % L'Hospital's Rule
    end
    
    
end


%xx1=roundn(xx1,-3);
mag3=abs(xx1);
ph3=angle(xx1);
figure; stem(omega1,mag3);
title('Magnitude Spectrum Diko mou fX1=25'); xlabel('Frequency (\omega_k)');
figure; stem(omega1,ph3);

title('Phase Spectrum Diki mou fX1=25'); xlabel('Frequency (\omega_k)');




omega2 = 2*pi*(0:26-1)./26;
fderiv = @(f,x) (f(x+eps)-f(x))/eps;    % Derivative of a function
xderiv =@(f,x) (f(x+eps)-f(x))/eps;     % Derivative of a function


for n = 1:26
    a=( 5*omega2(n)*0.5);
    bb=(omega2(n)*0.5);
    
    xx5(n)= exp(-2*j*omega2(n))*(sin(a)/sin(bb));
    if isnan(xx5(n))% Test for ‘NaN’
      xx5(n) =exp(-2*j*omega2(n))*((fderiv(@sin, omega2(n)/2)*5)./(xderiv(@sin,omega2(n)/2)));      % L'Hospital's Rule
    end
 
end


%xx5=roundn(xx5,-2);
mag2=abs(xx5);
ph2=angle(xx5);
figure; stem(omega2,mag2);
title('Magnitude Spectrum Diko mou X=26'); xlabel('Frequency (\omega_k)');
figure; stem(omega2,ph2);
title('Phase Spectrum Diki mou X=26'); xlabel('Frequency (\omega_k)');

%erwtima ζ) 
mag3(1:10)
ph3(1:10)

mag2(1:10)
ph2(1:10)
