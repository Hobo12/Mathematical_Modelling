function [ crash ] = total( X )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
crash=0;
A=[150 40 243;85 85 236;150 155 220.5;145 50 159;130 150 230;0 0 52];
for i=1:1:6
    for j=(i+1):1:6
        if judge( A(i,1),A(i,2),X(i),A(j,1),A(j,2),X(j) )==1 || edgejudge( A(i,1),A(i,2),X(i),A(j,1),A(j,2),X(j) )==1
            crash=1;
            break;
        else 
            crash=0;
        end
    end
end
end



