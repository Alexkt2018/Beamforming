function [receive,receive_temp ] = mimo(send,H,SNR)
% solve the recevied signal
% this program shows what signal has been  after they experience the MIMO
% channel,of course,there is also gaussian noise inevitable.
% input:send ->the matrix genarated by function stbc
% input£ºH -> the channel matrix
% output:receive ->the receive signal
%% begin
% the overall thougth:assume the send is X,H is H,receive is Y,gaussian
% noise is G,it is obvious that Y=H*X+G

for i=1:1:size(send,3)      %function size return how much sending matrix there are.
    receive_temp(:,:,i) = H*send(:,:,i);
    receive=awgn(receive_temp,SNR);  
    %function awgn will add the gaussian nosie to the siganl,the second
    %parameter is the SNR)
end
% m=size(send,2);
% n=m;
% receive_temp=zeros(1,n);
% for i=1:4:m
%     % j=1:4:n;
%     receive_temp(i)=H(1).*send(i)+H(2).*send(i+1);
%     receive_temp(i+1)=H(1).*send(i+2)+H(2).*send(i+3);
%     receive_temp(i+2)=H(3).*send(i)+H(4).*send(i+1);
%     receive_temp(i+3)=H(3).*send(i+2)+H(4).*send(i+3);q
%     receive=awgn(receive_temp,SNR);
% end
end