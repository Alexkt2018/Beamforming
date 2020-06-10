function s_hat = mimo2(receive,H)
%solve the receive signal
% input:receive ->the received signal
% input:H -> the channel matrix
% output:t -> the solved signal
%% begin
H1_hat = [conj(H(1)),H(3);conj(H(3)),-H(1)];
H2_hat = [conj(H(2)),H(4);conj(H(4)),-H(2)];
for i = 1:1:size(receive,3)
    y = receive(:,:,i);
    y1_hat = H1_hat*[y(1);-conj(y(3))];
    y2_hat = H2_hat*[y(2);-conj(y(4))];
    s1_hat = conj(norm(H(1))^2+norm(H(3))^2)*y1_hat(1)+conj(norm(H(2))^2+norm(H(4))^2)*y2_hat(1);
    s2_hat = conj(norm(H(1))^2+norm(H(3)^2))*y1_hat(2)+conj(norm(H(2))^2+norm(H(4))^2)*y2_hat(2);
    s_hat(:,:,i) = [s1_hat,conj(s2_hat);s2_hat,-conj(s1_hat)];
end