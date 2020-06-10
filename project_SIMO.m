clc;
clear all;
f=6e+09 %frequency 6GHz
c=3e+08 %speed of light
d=0.01 %distances between receive antennas 0.01m
n=[1 2 3 4] %receive antennas
angle=linspace(0,pi/2,8) %transmit antennas' angle alpha
s=sin(angle.') %transmit antennas

    for i=1:4
    A(i)=2.*pi.*f.*(n(i)).*d.*s(2)/c %phase delay
    B(i)=(4.*pi.*f.*d.*(n(i))*s(2))/c.^2 %amplitude delay
    i=i+1
    end

L=-2*pi:pi/100:2*pi

subplot(6,2,1); plot(sin(L+A(1))); title('fig.1')
subplot(6,2,2); plot(sin(L+A(2))); title('fig.2')
subplot(6,2,3); plot(sin(L+A(3))); title('fig.3')
subplot(6,2,4); plot(sin(L+A(4))); title('fig.4')
subplot(6,2,5); plot(sin(L+A(1))+sin(L+A(2))+sinc(L+A(3))+sinc(L+A(4))); title('fig.5')
subplot(6,2,6); plot(5.*sin(L+A(1))); title('fig.6')