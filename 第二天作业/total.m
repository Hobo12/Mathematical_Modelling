function [ crash ] = total( A )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
crash=0;
for i=1:1:6
    for j=(i+1):1:6
        if judge( A(i,1),A(i,2),A(i,3),A(j,1),A(j,2),A(j,3) )==1 || edgejudge( A(i,1),A(i,2),A(i,3),A(j,1),A(j,2),A(j,3) )==1
            crash=1;
            break;
        else 
            crash=0;
        end
    end
end
end



