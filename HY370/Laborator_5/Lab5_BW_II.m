% specifications
wp = 0.2*pi;
ws = 0.3*pi;
d1 =0.89125; % INSERT CODE HERE
d2 =0.17783; % INSERT CODE HERE

% parameter calculation
% solve 2x2 system for (N,Wc)
% DO NOT insert specific values but only code that does the work
e=sqrt((1/(power(0.89125,2)))-1);
A=1/d2;
K=(0.3*pi)/(0.2*pi);
K1=e/(sqrt(power(A,2)-1));
N =abs(log10(1/K1)/log10(1/K));
disp(['order butterworth N= ', num2str(N)]);
%Wc = % INSERT CODE HERE
LogWc=(log10(wp)-1/12*(log10(e)));
% N must be an integer
N = ceil(N);
disp(['ceiled  N= ', num2str(N)]);
% equation 7.15a of Greek version of O&S again to find Wc for the integer N
tmp=1/d1;
Wc =0.2*pi/nthroot(power(tmp,2)-1,12); % INSERT CODE HERE
disp(['new Wc = ', num2str(Wc)]);


% poles
k = 0:2*N-1;
sk = Wc.*exp((j*pi/12).*(2.*k+N-1));

% get only the upper left-hand plane poles: sigma_k <0 & W_k >0
sk = sk(2:7)

% Continuous time filter:
B = Wc^N; % Numerator
A1 = conv([1 -sk(1)], [1 -conj(sk(1))]);
A2 =conv([1 -sk(2)], [1 -conj(sk(2))]); % INSERT CODE HERE
A3 =conv([1 -sk(3)], [1 -conj(sk(3))]); % INSERT CODE HERE
temp = conv(A1, A2);
A=conv(temp,A3); % INSERT CODE HERE % Denominator

% Impulse invariance method --> Transformation from analog [B,A] to digital [Bz, Az]
[Bz, Az] = impinvar(B, A);

% Frequency response - use function freqz
[H, w] =freqz(Bz, Az, 512);
 

% Group delay - use function grpdelay
[Gd, w] =grpdelay(Bz, Az, 512);

figure(1);
subplot(311);plot(w/pi,20*log10(abs(H)));  % Divide with pi for an easier check
subplot(312);plot(w/pi,abs(H));
subplot(313);plot(w/pi,Gd)

[s,fs] = wavread('/home/klodjan/MEGA/simeiosis/HY370/Laborator_5/speech.wav');
%soundsc(s, fs);

y=filter(Bz,Az,s);
soundsc(y, fs);
