%% Discription
% this program simulates the positioning process on different AOA

%% 
clc;
clear all;
% f = 3e+10 %mmWave frequency 24.25GHz-52.6G
% c = 3e+08 %speed of light
% d = 0.01 %distances between receive attennas 0.01m
% n = [1 2] %alamouti receive attennas
bit = bit_source(10000);
% genarate the bit source;
code = ConvolutionalCode(bit);
% source encoding
QPSK = QPSK_F(code);
% modulation
send = stbc_encode(QPSK);
% stbc encoding
H = channel_coeff(2,2);
% channel matrix


SNR = 1;
%x = 2.*pi.*f.*(n-1).*d.*sin(alpha)/c %phase delay
[receive,receive_temp]=mimo(send,H,SNR);
% receive the signal
s_hat=mimo2(receive,H);
unjudge=stbc_decode(s_hat);
% merge all the signal received
QPSK_demo=QPSK_F_demodulation(unjudge,code);
% sink demodulation
decoded=ConvolutionalDecode(QPSK_demo);
% decode the receive signal

x = 1:length(bit);
% scatter(x,bit)
% hold on
% scatter(x,decoded)
% hold on

% error bit: 1
c = 0;
for i = 1:length(bit)
    if bit(i) == decoded(i)
        compare(i) = 0;
    else
        compare(i) = 1;
        c = c + 1;
    end
end
scatter(x,compare)