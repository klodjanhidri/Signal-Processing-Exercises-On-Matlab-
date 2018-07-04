wp = 0.2*pi;
ws = 0.3*pi;
d1 = 0.89125;
d2 = 0.17783;

fs = 8000; 
Wp = wp*fs;
Ws = ws*fs;


[Nm, Wcm] = buttord(Wp, Ws, -20*log10(d1), -20*log10(d2), 's');
[Bm, Am] = butter(Nm, Wcm, 's'); % Constructs the filter
[Bzm, Azm] = impinvar(Bm, Am, fs); % Analog -> Digital
[Hm, w] = freqz(Bzm, Azm, 512);
[Gdm, w] = grpdelay(Bzm, Azm, 512);
figure;
subplot(311);plot(w/pi, 20*log10(abs(Hm))); % Divide with pi for easier check
subplot(312);plot(w/pi, abs(Hm));
subplot(313);plot(w/pi, Gdm)

[s,fs] = wavread('/home/klodjan/MEGA/simeiosis/HY370/Laborator_5/speech.wav');
soundsc(s, fs);

y=filter(Bzm,Azm,s);
soundsc(y, fs);