function send = stbc_encode(qpsk)
% stbc encoding for sending signal
% this program will encode the signal comes from modulation into matrix
% which is suitable for sending in a MIMO channel.this program assume the
% Alamouti,that means there are 2 sending antennas and 1 receiving antenna.
% input£ºqpsk ->the modulation signal come from function QPSK
% output:send ->the sending matrix suitable for MIMO channel.
% 2014/6/29 release lsf:optimize,abandon for circulation,adopt point
% operation instead;meanwhile,abandon 3D matrix,adopt 1D vector to storage
% the siganl,so the function mimo has been modify.
%% begin
% the overall thougth:fetch two signals from the sequence each time,and
% genarate a matrix by alamouti.for example,if you fecth x1 and x2,the
% genarated matrix will be [x1,-conj(x2);x2,conj(x1)].PS:conj means
% conjugate.

%% project A
% for circulation && 3D matrix;
for i=1:2:size(qpsk,2)      
    s=[qpsk(i),conj(qpsk(i+1));qpsk(i+1),-conj(qpsk(i))];
    send(:,:,(i+1)/2)=s;
end
% matrix send is a 3D matrix,its third demension store the 2*2 matrix
% genarated by alamouti.In other words,send(:,:,1) means the alamouti
% matrix genatated by x1,x2,and sendd(:,:,2) is x3,x4 and so on.

%% project B
% point operation && vector
% m=size(qpsk,2);     % function size return the length of modulation siganl.
% n=2*m;              % n is the length of vector send,which is twice as large as size of qpsk
% send=zeros(1,n);
% 
% % our goal is transfer qpsk siganl to another kind of signal to use
% % diversity scheme.There are four steps to accomplish it.
% % assume:
% % qpsk=[x1,x2,x3,x4,......];
% % send=[x1,x2,-conj(x2),conj(x1),x3,x4,-conj(x4),conj(x3),......];
% 
% i=1:2:m;
% j=1:4:n;
% for a=1:m/2
%     % first:send(1)=qpsk(1),send(5)=qpsk(3)....and so on.
%     send(j(a))=qpsk(i(a));
%     % second:send(2)=qpsk(2),send(6)=qpsk(4).....and so on.
%     send(j(a)+1)=qpsk(i(a)+1);
%     % third:send(3)=-conj(qpsk(2)),send(7)=-conj(qpsk(4)),.....and so on.
%     send(j(a)+2)=-conj(qpsk(i(a)+1));
%     % fourth:send(4)=conj(qpsk(1)),send(8)=conj(qpsk(3)),.....and so on.
%     send(j(a)+3)=conj(qpsk(i(a)));
%     end
% end