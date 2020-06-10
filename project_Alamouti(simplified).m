clc;
clear all;
f=6e+09 %frequency 6GHz
c=3e+08 %speed of light
d=0.01 %distances between receive attennas 0.01m
n=[1 2] %receive attennas
angle=linspace(0,pi/2,4) %transmit attennas' angle alpha
s=sin(angle.') %transmit attennas
j=sqrt(-1)
E1=(0+0.5)*rand(100,1)
E2=(0.5+1)*rand(100,1)

for j=1:2
    for i=1:2
    A(i,j)=2.*pi.*f.*(n(i)).*d.*s(j+1)/c %phase delay
    B(i,j)=(4.*pi.*f.*d.*(n(i))*s(j+1))/c.^2 %amplitude delay
    i=i+1
    end
    j=j+1
end

for k=1:2
    figure(k)
    subplot(2,1,1); plot(sqrt(E1).*exp(j.*A(k,1))./(B(k,1))) %E1 from A received by C/D at t1
    hold on
    plot(sqrt(E2).*exp(j.*A(k,2))./(B(k,2))); title('fig.1') %E2 from B received by C/D at t1
    hold off
    subplot(2,1,2); plot(sqrt(E2).*exp(j.*A(k,1))./(B(k,1))) %E2 from A received by C/D at t2
    hold on
    plot(sqrt(E1).*exp(j.*A(k,2))./(B(k,2))); title('fig.2') %E1 from B received by C/D at t2
    hold off
end
figure(3)
subplot(4,2,1); plot(sqrt(E1).*exp(j.*A(k,1))./(B(k,1))+sqrt(E1).*exp(j.*A(k,2))./(B(k,2))) %received signal E1
subplot(4,2,2); plot(sqrt(E2).*exp(j.*A(k,2))./(B(k,2))+sqrt(E2).*exp(j.*A(k,1))./(B(k,1))) %received signal E2
subplot(4,2,3); plot(sqrt(E1))
subplot(4,2,4); plot(sqrt(E2))