function unjudge = stbc_decode(s_hat)
% merge the signal all recevied
% this program will merge all the signal which are recevied by receviers.
% alamouti 2*2
% input:receive ->the signal experienced MIMO channel
% input:H ->channel matrix
% output:unjudge ->the signal merged,it will be judged by demodulation.
% 2014/7/1 last lsf release 
% 2014/7/1 optimize:abandon the for circulation and adopt the point
% operation;predistribute the space for vector unjudge;
%% begin
for i=1:size(s_hat,3)
    s=s_hat(:,:,i);
    unjudge(2*i-1)=s(1);
    unjudge(2*i)=s(2);
end
% m=size(receive,2);
% % unjudge=zeros(m);
% %unjudge_temp=zeros(m/2);
% unjudge=zeros(1,m/2);
% unjudge_temp=zeros(1,m);
% i=1:4:m;
% %j=1:4:m;
% unjudge_temp(i)=conj(H(1)).*receive(i)+H(2).*receive(i+1);
% unjudge_temp(i+1)=conj(H(2)).*receive(i)+(-H(1)).*conj(receive(i+1));
% unjudge_temp(i+2)=conj(H(3)).*receive(i+2)+H(4).*receive(i+3);
% unjudge_temp(i+3)=conj(H(4)).*receive(i+2)+(-H(3)).*conj(receive(i+3));
% i=1:4:m;
% j=1:2:m/2;
% unjudge(j)=unjudge_temp(i)+unjudge_temp(i+2);
% unjudge(j+1)=unjudge_temp(i+1)+unjudge_temp(i+3);
% %unjudge_temp(j)=hh*[receive(2.*i-1),receive(2.*i)]';
% %unjudge(2.*i-1:2.*i)=[hh.*[receive(2.*i-1),receive(2.*i)]']';

end