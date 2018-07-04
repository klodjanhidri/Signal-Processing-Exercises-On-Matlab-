% Vowel synthesis using the Z-domain
%
% HY370 - Digital Signal Processing
% Laboratory Exercise #3
%
% Winter Semester 2016
%
% (c) G. Kafentzis, CSD, UoC, Greece

% Sampling frequency
fs =8000; % INSERT CODE HERE

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create the excitation signal - a series of glottal pulses that will travel the vocal tract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Select a fundamental frequency f0
f0 =200; % INSERT CODE HERE

% Call genpulse.m to generate a series of deltas - store the result in vector e
e = genpulse(f0,2);% INSERT CODE HERE

% Call rosenmodel.m to generate a period of glottal pulse - store it in vector g
g =rosenmodel(60,10,100); % INSERT CODE HERE
figure;plot(g);
% Convolve e and g to generate a series of glottal pulses - store it in vector gp
gp =conv(e,g); % INSERT CODE HERE
P = 0.006;
gp = gp + P*randn(1,length(gp));
figure;plot(gp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create the H(z) filter for the vocal tract - it is an all-pole filter (no zeros on the plane)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1st pair of poles
%%%%%%%%%%%%%%%%%%%
Omega_1 =2*pi*700/8000 % INSERT CODE HERE
a_1 =0.983; % INSERT CODE HERE
z1 = a_1*exp(1i*Omega_1);
z1c =conj(z1); % INSERT CODE HERE
oros1 =conv([1 -z1], [1 -z1c]); % INSERT CODE HERE


% 2nd pair of poles
%%%%%%%%%%%%%%%%%%%
Omega_2 =2*pi*1200/8000 % INSERT CODE HERE
a_2 =0.975 % INSERT CODE HERE
z2 = a_2*exp(1i*Omega_2);
z2c =conj(z2); % INSERT CODE HERE

oros2 =conv([1 -z2], [1 -z2c]); % INSERT CODE HERE


% 3rd pair of poles
%%%%%%%%%%%%%%%%%%%
Omega_3 =2*pi*2800/8000 % INSERT CODE HERE
a_3 =0.89; % INSERT CODE HERE
z3 = a_3*exp(1i*Omega_3);
z3c =conj(z3) % INSERT CODE HERE

oros3 =conv([1 -z3], [1 -z3c]); % INSERT CODE HERE


% 4th pair of poles
%%%%%%%%%%%%%%%%%%%
Omega_4 =2*pi*3600/8000 % INSERT CODE HERE
a_4 =0.90 % INSERT CODE HERE
z4 = a_4*exp(1i*Omega_4);
z4c = conj(z4)% INSERT CODE HERE

oros4 =conv([1 -z4], [1 -z4c]); % INSERT CODE HERE


% Combine poles to form H(z) polynomial - use conv function
oroi12 =conv(oros1, oros2); % INSERT CODE HERE
oroi34 =conv(oros3, oros4); % INSERT CODE HERE
num = 1;
den =conv(oroi12, oroi34); % INSERT CODE HERE


% Checking - experiment with a_i if necessary
[H,W] = freqz(num, den, 1024, fs);
plot(W, 20*log10(abs(H))); grid;title('A frequence');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pass the series of glottal pulses gp throught system H(z) - use filter function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y =filter(num, den, gp); % INSERT CODE HERE



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate vowel speech by passing y through the lips function - use conv or filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% l[n]=delta[n]-0.95[n-1]
B=[1 -0.95];
A=1;
speech =filter(B,A,y); % INSERT CODE HERE

% Normalize
speech = speech/max(abs(speech));

% Listen 
soundsc(speech, fs);


%%%%%%%%%%%%%%%%%

