function [ B ] = illness(X,T)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
A=rand(1,T);
B=round(A(1:T).*X./sum(A))
end

