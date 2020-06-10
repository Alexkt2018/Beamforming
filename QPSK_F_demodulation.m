function QPSK_F_demo = QPSK_F_demodulation(QPSK,m)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% 2014/7/1 lsf last release
% 2014/7/1 optimize:use the function sign to adopt poing operation.
num=length(m);
QPSK_F_demo_I=1/2*(QPSK+conj(QPSK));
QPSK_F_demo_Q=-1/2*1i*(QPSK-conj(QPSK));
% for i=1:num/2;
%     if QPSK_F_demo_I(i)>0
%         QPSK_F_demo_I(i)=1;
%     else
%         QPSK_F_demo_I(i)=-1;
%     end
% end
% for i=1:num/2;
%     if QPSK_F_demo_Q(i)>0
%         QPSK_F_demo_Q(i)=1;
%     else
%         QPSK_F_demo_Q(i)=-1;
%     end
% end    
i=1:num/2;
QPSK_F_demo_I(i)=sign(QPSK_F_demo_I(i));
QPSK_F_demo_Q(i)=sign(QPSK_F_demo_Q(i));
QPSK_F_demo(1:2:(num-1))=-1/2*(QPSK_F_demo_I-1);  
QPSK_F_demo(2:2:num)=-1/2*(QPSK_F_demo_Q-1);      
end