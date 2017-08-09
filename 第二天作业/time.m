function [t] = time( x1,y1,a,x2,y2,b )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
l11=(160-x1)/(cos(a/180*pi)); 
l12=(160-y1)/(sin(a/180*pi));
if l11>l12
    l1=l12;
else l1=l11;
end
t1=l1*9/2;

l21=(160-x2)/(cos(b/180*pi)); 
l22=(160-y2)/(sin(b/180*pi));
if l21>l22
    l2=l22;
else l2=l21;
end
t2=l2*9/2;

if t1>t2
    t=t2;
else t=t1;
end

end

