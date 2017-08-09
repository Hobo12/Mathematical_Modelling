function [ crash ] = loop( tmax,x1,y1,a,x2,y2,b)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
crash=0;
for t=0:1:tmax
if distance(t,x1,y1,a,x2,y2,b)<=8
    crash=1;
    break
else
    crash=0;
end
end

