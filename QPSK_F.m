function QPSK = QPSK_F(m)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
num=length(m);
QPSK_in=-2*m+1;% ת����˫���Էǹ�����
QPSK_in_I=QPSK_in(1:2: (num-1)); 
QPSK_in_Q=QPSK_in(2:2:num); 
QPSK_IQ=[QPSK_in_I;QPSK_in_Q];
p=[1,1i];
QPSK=p*QPSK_IQ;
end