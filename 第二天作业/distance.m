function [y] = distance(t,x1,y1,a,x2,y2,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

y = sqrt((x1-x2+2/9*t*(cos(a)-cos(b)))^2+(y1-y2+2/9*t*(sin(a)-sin(b)))^2);

end

