function QPSK = QPSK_F(m)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
num=length(m);
QPSK_in=-2*m+1;% 转换成双极性非归零码
QPSK_in_I=QPSK_in(1:2: (num-1)); 
QPSK_in_Q=QPSK_in(2:2:num); 
QPSK_IQ=[QPSK_in_I;QPSK_in_Q];
p=[1,1i];
QPSK=p*QPSK_IQ;
end