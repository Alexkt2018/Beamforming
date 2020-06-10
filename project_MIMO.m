clc;
clear all;
f=6e+09 %frequency 6GHz
c=3e+08 %speed of light
d=0.01 %distances between receive attennas 0.01m
n=[1 2 3 4 5] %receive attennas
angle=linspace(0,2*pi,8) %transmit attennas' angle alpha
for t=2:7
   
x=2.*pi.*f.*(n-1).*d.*sin(angle(t))/c %phase delay
y=(4.*pi.*f.*(n-1).*d.*sin(angle(t))/c).^2 %amplitude delay
L=-2*pi:pi/100:2*pi
figure(t-1)
subplot(7,2,1); plot(L,sinc(L+x(1)));title('fig.1') 
subplot(7,2,2); plot(L,sinc(L+x(2))/y(2));title('fig.2') 
subplot(7,2,3); plot(L,sinc(L+x(3))/y(3));title('fig.3') 
subplot(7,2,4); plot(L,sinc(L+x(4))/y(4));title('fig.4') 
subplot(7,2,5); plot(L,sinc(L+x(5))/y(5));title('fig.5') 
subplot(7,2,6); plot(L,sinc(L+x(1))+sinc(L+x(2))/y(2)+sinc(L+x(3))/y(3)+sinc(L+x(4))/y(4)+sinc(L+x(5))/y(5));title('fig.6') 
subplot(7,2,7); plot(L,sinc(L+x(1))*(1+1/y(2)+1/y(3)+1/y(4)+1/y(5)));title('fig.7') 
t=t+1
end