function [ B ] = illness(X,T)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
A=rand(1,T);
B=round(A(1:T).*X./sum(A))
end

