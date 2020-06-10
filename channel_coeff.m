function hh=channel_coeff(NT,NR)
%   correlated Rayleigh MIMO channel coefficient 
%   Inputs:
%       bit     :bit source;
%       NT    : number of transmitters 
%       NR    : number of receivers 
%       hh     : NR x NT x N correlated channel 

%MIMO-OFDM Wireless Communications with MATLAB   Yong Soo Cho, Jaekwon Kim, Won Young Yang and Chung G. Kang
%?2010 John Wiley & Sons (Asia) Pte Ltd

% uncorrelated Rayleigh fading channel, CN(1,0)
%% project A
hh=sqrt(1/2)*(randn(NT,NR)+1i*randn(NT,NR));
end