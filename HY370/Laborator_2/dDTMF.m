function [Fvec, number] = dDTMF(x)
%
%
% Given a signal x which contains a phone number according to 
% DTMF standard it returns the frequencies that are present
% in the signal and the number in a character vector
%
%
%  G. Kafentzis (c) UOC, CSD, 2012

% DTMF frequencies
DTMFfr = [697 770 852 941 1209 1336 1477];

% Length of the DTMF vector
L = length(DTMFfr);

% Build the frequency table
h = makeFB(DTMFfr);

% Sampling frequency
fs = 8000;

% Tone duration in sec
d = 0.5;

% Tone duration in samples
ds = % INSERT CODE HERE

% Silence duration in sec
sil = 0.1;

% Silence duration in samples
sils = % INSERT CODE HERE

% How many frames "tone+silence" fit in the whole signal?
Lt = round((length(x)+sils)/(ds+sils));

% Tone length
st = 1:ds;

% Tone and silence duration
sh = ds+sils;

% Initialization
Fvec = zeros(Lt,2);

% For every frame...
for i = 1:Lt
	
	% Get the corresponding piece out of the signal...	
  	fr = x(st);
	
	% Calculate the energy of the frame fr
	En = % INSERT CODE HERE
	
	k = 1;
	
	for j = 1:L
		% Filter segment fr
		sc = % INSERT CODE HERE
		
		% Calculte the energy after filtering
		S = % INSERT CODE HERE
		
		% Normalize S with En
		R = S/En;
		
		% Find a threshold (2 times the corresp. filter h(:,j) energy works well)
		if(R > % INSERT CODE HERE )
	
     		Fvec(i,k) = DTMFfr(j);
	
			k = k + 1;
		end   
	end
  	st = st + sh;  % move frame
end


% Detect number
[M,N] = size(Fvec);
number = [];

for i = 1:M
    if Fvec(i,1) == 697
        if Fvec(i,2) == % INSERT CODE HERE
            number = [number '1'];
        elseif Fvec(i,2) == % INSERT CODE HERE
            number = [number '2'];
        elseif Fvec(i,2) == % INSERT CODE HERE
            number = [number '3'];
        end
    elseif Fvec(i,1) == 770
        if Fvec(i,2) == % INSERT CODE HERE
           number = [number '4'];
        elseif Fvec(i,2) == % INSERT CODE HERE
           number = [number '5'];
        elseif Fvec(i,2) == % INSERT CODE HERE
           number = [number '6'];
        end
    elseif Fvec(i,1) == 852 
       if Fvec(i,2) == % INSERT CODE HERE
           number = [number '7'];
       elseif Fvec(i,2) == % INSERT CODE HERE
           number = [number '8'];
       elseif Fvec(i,2) == % INSERT CODE HERE
           number = [number '9'];
       end
    elseif Fvec(i,1) == 941 
       if Fvec(i,2) == 1209
           number = [number '*'];
       elseif Fvec(i,2) == % INSERT CODE HERE
           number = [number '0'];
       elseif Fvec(i,2) == % INSERT CODE HERE
           number = [number '#'];
       end
    end
end

