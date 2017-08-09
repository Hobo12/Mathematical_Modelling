function [crash] = judge( x1,y1,a,x2,y2,b )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
d11=abs((160-x1)/(cos(a/180*pi))); 
d12=abs((160-y1)/(sin(a/180*pi)));
if d11>d12
    d1=d12;
else
    d1=d11;
end
t1=d1*9/2;
 
d21=abs((160-x2)/(cos(b/180*pi))); 
d22=abs((160-y2)/(sin(b/180*pi)));
if d21>d22
    d2=d22;
else
    d2=d21;
end
t2=d2*9/2;
 
if t1>t2
    t=t2;
else
    t=t1;
end
a = a*pi/180;
b = b*pi/180;
crash = loop(t,x1,y1,a,x2,y2,b);
end

