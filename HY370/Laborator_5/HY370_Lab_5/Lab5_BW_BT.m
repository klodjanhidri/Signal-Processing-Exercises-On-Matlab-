% specifications
wp = 0.2*pi;
ws = 0.3*pi;
d1 = 0.89125;
d2 = 0.17783;

Td = 1;
Wp = tan(wp/2);% INSERT CODE HERE
Ws =tan(ws/2); % INSERT CODE HERE

% parameter calculation
% solve 2x2 system for (N,Wc)
% DO NOT insert specific values but only code that does the work
%Wc = % INSERT CODE HERE

% evresh tou N me dikia mou eksiswsi
e=sqrt((1/(power(d1,2)))-1);
A=1/d2;
K=Ws/Wp;
K1=e/(sqrt(power(A,2)-1));
N =abs(log10(1/K1)/log10(1/K));
disp(['[me dikia mou oilopoihsi]  order butterworth N= ', num2str(N)]);

%sumfwna me thn eksiswsi tou vivliou
N1=(log10((power(1/d2,2)-1)/(power(1/d1,2)-1)))/(2*log10(Ws/Wp));
disp(['[apo eksisosi vivliou] order butterworth N= ', num2str(N1)]);

% N must be an integer
N = ceil(N);

% equation: 7.32b of Greek version of O&S again to find Wc for the integer N
%Wc = % INSERT CODE HERE
tmp=1/d2;
Wc =(Ws*2)/nthroot(power(tmp,2)-1,12);
disp(['new Wc = ', num2str(Wc)]);
% poles
k = 0:2*N-1;
sk = Wc.*exp((j*pi/12).*(2.*k+N-1));

% get only the upper LHP poles: sigma_k <0 & W_k >0
sk = sk(2:7);

% Continuous time filter:
B = Wc^N;
A1 = conv([1 -sk(1)], [1 -conj(sk(1))]);
A2 =conv([1 -sk(2)], [1 -conj(sk(2))]); % INSERT CODE HERE
A3 =conv([1 -sk(3)], [1 -conj(sk(3))]); % INSERT CODE HERE
temp = conv(A1, A2);
A=conv(temp,A3);



[Bz,Az] = bilinear(B, A, 1/Td);
[H,w] = freqz(Bz, Az, 512);% INSERT CODE HERE
[Gd,w]=grpdelay(Bz, Az, 512); % INSERT CODE HERE

figure(3);
subplot(311);plot(w/pi,20*log10(abs(H)));  % Divide with pi for easier check
axis([0 1 -100 20]);
subplot(312);plot(w/pi,abs(H));
axis([0 1 0 1]);
subplot(313);plot(w/pi,Gd);


[s,fs] = wavread('/home/klodjan/MEGA/simeiosis/HY370/Laborator_5/speech.wav');
%soundsc(s, fs);

y=filter(Bz,Az,s);
soundsc(y, fs);