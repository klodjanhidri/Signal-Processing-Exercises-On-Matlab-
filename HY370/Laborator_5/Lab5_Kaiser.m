wp=0.4*pi;
ws=0.6*pi;
delta=0.001;
wc=(wp+ws)/2;
Dw=ws-wp;
A=-20*log10(delta);

M=ceil((A-8)/(2.285*Dw));
a=M/2;

if A>50
b=0.1102*(A-8.7)
end

if A>=21
    if A<=50
        b=0.5842*( power(A-21,0.4))+0.07886*(A-21);
    end
end

if A<21
    b=0;
end


%I=besseli(a,b)
[I]=besseli(0,b*sqrt(1-(((0:M-1)-(M-1)/2)/((M-1)/2)).^2))/besseli(0,b)