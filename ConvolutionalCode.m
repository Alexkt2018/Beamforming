function code= ConvolutionalCode(m)
% input£ºm -> bit source
% output:code 
g0=[1 0 1 1 0 1 1 1 1];
%g0=[1 1 1 1 0 1 1 0 1];
g1=[1 1 0 1 1 0 0 1 1];
%g1=[1 1 0 0 1 1 0 1 1]
g2=[1 1 1 0 0 1 0 0 1];
%g2=[1 0 0 1 0 0 1 1 1];
m0=conv(m,g0);
m1=conv(m,g1);
m2=conv(m,g2);
l=length(m0);
for i=1:l
    code([3*i-2])=rem(m0([i]),2);
    code([3*i-1])=rem(m1([i]),2);
    code([3*i])=rem(m2([i]),2);  
end      
end
