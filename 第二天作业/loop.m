function [ crash ] = loop( tmax,x1,y1,a,x2,y2,b)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
crash=0;
for t=0:1:tmax
if distance(t,x1,y1,a,x2,y2,b)<=8
    crash=1;
    break
else
    crash=0;
end
end

