n = 0:149;                                                  % Discrete time indices
x = 2*cos(0.1*pi*n) +2*cos(0.15*pi*n)+ 3*sin(0.2*pi*n); 	% Signal 
stem(n,x);xlabel('Samples');                            	% Visualize
title('Synthetic signal'); 
