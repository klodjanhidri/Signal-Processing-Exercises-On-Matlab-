
fs = 1; % sampling frequency in Hz : does not matter
wp = 0.2*pi;
ws = 0.3*pi;
Wp = 2*fs*tan(wp/2);
Ws = 2*fs*tan(ws/2);
d1 =0.89125; % INSERT CODE HERE
d2 =0.17783; % INSERT CODE HERE


[Nm, Wcm] = buttord(Wp, Ws, -20*log10(d1), -20*log10(d2), 's');
[Bm, Am] = butter(Nm, Wcm, 's'); % Construct filter
[Bzm, Azm] = bilinear(Bm, Am, fs); % Analog -> Digital
[Hm, w] = freqz(Bzm, Azm, 512);
[Gdm, w] = grpdelay(Bzm, Azm, 512);
figure;
subplot(311);plot(w/pi, 20*log10(abs(Hm)));
subplot(312);plot(w/pi, abs(Hm));
subplot(313);plot(w/pi, Gdm)

[s,fs] = wavread('/home/klodjan/MEGA/simeiosis/HY370/Laborator_5/speech.wav');
soundsc(s, fs);

y=filter(Bzm,Azm,s);
soundsc(y, fs);
