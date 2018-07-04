function x = call(tel)

%
% it creates a signal corresponding to the phone number
% specified by tel according to DTMF standard
% For instance: x = call([6 9 7 1 1 1 1 1 1 1]);
%
%
% (c) UOC, CSD, 2003

fs = 8000;

d = 0.5;
ds = d*fs;
sil = 0.1;
sils = sil*fs;

Lt = length(tel);
D = d*Lt+sil*(Lt-1);
Ds = D*fs;  % in samples;

x = zeros(Ds,1);
st = 1:ds;
sh = ds+sils;
n = 0:ds-1;

for i = 1:Lt
   if(tel(i)==1)
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   elseif(tel(i)==2)
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   elseif(tel(i)==3)
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   elseif(tel(i)==4)
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   elseif(tel(i)==5)
     x(st) = cos(2*pi*770/fs*n)+cos(2*pi*?????*n);
   elseif(tel(i)==6)
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   elseif(tel(i)==7)
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   elseif(tel(i)==8)
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   elseif(tel(i)==9)
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   else % 0
     x(st) = cos(2*pi*?????*n)+cos(2*pi*?????*n);
   end
   st = st+sh;
end

% scale up:
x = x*10000;

% listen to results
soundsc(x,8000);
