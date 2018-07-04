n = 0:99;                  % Discrete time indices
x = cos(0.1*pi+0.4*n); 	   % Signal 
stem(n,x);xlabel('Samples');% Visualize
title('Synthetic signal'); 
