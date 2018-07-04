% Simple Blind Source Separation
% Lab #6 for DSP course
%
% Script by George Kafentzis, CSD, UoC, 2016

clear all; 
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%                   LOAD DATA AND MIX                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% We mix two sources
N = 2;

[s(1,:), fs] = wavread('source1.wav')';
[s(2,:), fs] = wavread('source2.wav')';

% Choice of the mixing matrix
A = [0.6, 0.9 ;
     0.4, 0.5 ];

% Mix sources
x = A * s;

% Number of observations (N=P=2)
P_obs = N;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%                   SEPARATING SYSTEM                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Choice of the BSS-STFT based parameters
nb_win = 10;           % Number of windows to detect sources
nb_samp_in_win = 128;  % Number of DFT samples
overlap = 0.75;        % Percentage (75%) of overlap between
                       % successive analysis windows

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%                                                        % 
%               INSERT CODE FOR STFT HERE                %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ratio_nb_col = length(X(1,1,:));
ratio_nb_row = length(X(1,:,1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
%   INSERT CODE TO DETECT TF SINGLE-SOURCE ZONES         %
%   AND IDENTIFY COLUMNS oF MATRIX B (the following      %
%   code is simply a suggestion - you can write your     %
%   own)                                                 %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  Initialization of the analysis zones 
nb_zones = 2 * floor(ratio_nb_col / nb_win) - 1;

% Computation of the variance of the ratio used in order to find TF single
% source zones
variance = zeros(ratio_nb_row, nb_zones);

for i = 1:ratio_nb_row
    for j = 1:nb_zones
            variance(i,j) = % INSERT CODE HERE - use var function
    end 
end


% we compute the distance between a new column of B and
% each previous found one. If this distance is above a user-defined 
% threshold, we keep this new column. We call this threshold c_thresh.
c_thresh = 0.15;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
%                                                        % 
%             INSERT CODE FOR FINDING B = hat{A}         %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%                   CHECK PERFORMANCE                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Computation of the theoretical matrix to be identified
B_theo = zeros(size(A));
for i = P_obs:-1:1
    B_theo(i,:) = A(i,:)./A(1,:);
end

% Estimate your sources - y1 is a two-channel signal [s1 s2]
y1 = inv(B) * x;

% Listen to source #1
soundsc(y1(1,:), fs); %
pause(3);
% Listen to source #2
soundsc(y1(2,:), fs);

% Theoretical output
theo_out = inv(B_theo)*x;