filename='Pat.wav';

[pattern, fs] = audioread(filename);
soundsc(pattern, fs);
figure(1); plot(pattern); xlabel('Samples');
[noisy, fs] = audioread('noisy.wav');
soundsc(noisy, fs);
figure(2); plot(noisy); xlabel('Samples');

% INSERT CODE HERE;
[cross_corr, lags] = xcorr(noisy,pattern); % Compute cross-correlation                       
 figure(3); plot(lags, cross_corr); 

% Plot it and check it carefully
xlabel('Lags'); title('Cross-correlation');
 
% INSERT CODE HERE ;
% Use findpeaks to easily detect instants of high correlation
[pks, locs] = findpeaks(cross_corr,'MinPeakHeight',0.8);

for j=1:size(locs)
   locations(j)=locs(j)-6000; 
end
plot(lags, cross_corr); hold on; plot(locations, pks, 'o'); hold off;


% Copy noisy signal to process it
clean = noisy;
% Subtract pattern from noisy signal - use "clean" vector
% For every lag index present in vector locs, you have
% to subtract the pattern signal from the received signal
% Use operator ":" to choose pieces of the signal in MATLAB
% as follows:findpeaks( 'minpeakheight') example
% signal(start:end) = signal(start:end) - another_signal(start:end);
index=1;
for i = 1:length(locations)
%%%%%%%%%%%%%%%%%%
% INSERT CODE HERE
%%%%%%%%%%%%%%%%%%
    start=locations(i);
    ends=locations(i)+50;     
    for j=start:ends-1
        clean(j+1)=clean(j+1)-pattern(index);
        index=index+1;
    end
    index=1;
end

        
% Listen! It should sound perfectly clear...
wavwrite(clean,fs,'clean_voice.wav');
soundsc(clean, fs);
