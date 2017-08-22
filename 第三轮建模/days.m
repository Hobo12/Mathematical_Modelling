function [ y ] = days( n,i )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
if n==1 && (mod(i,7)==6 || mod(i,7)==1)%白内障单眼周1或周6来
    y=5;
end

if n==1 && mod(i,7)~=6 && mod(i,7)~=1 && mod(i,7)~=0%白内障单眼非周1周6周7来
    y=5+7-mod(i,7)-1;
end

if n==1 && mod(i,7)==0%白内障单眼周7来
    y=5+1;
end

if n==2 && mod(i,7)==6%白内障双眼周6来
    y=7;
end

if n==2 && mod(i,7)~=6%白内障双眼非周6来
    y=7+7-mod(i,7)-1;
end

if n==3 && mod(i,7)~=5 && mod(i,7)~=0%青光眼非周五周日来
    y=11;
end

if n==3 && (mod(i,7)==5 || mod(i,7)==0)%青光眼周五或周日来
    y=11+1;
end

if n==4 && mod(i,7)~=5 && mod(i,7)~=0%视网膜疾病非周五周日来
    y=13;
end

if n==4 && (mod(i,7)==5 || mod(i,7)==0)%视网膜疾病周五或周日来
    y=13+1;
end

if n==5
    y=7;
end

end

