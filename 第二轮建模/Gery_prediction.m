    clc;  
    syms a b;  
    c=[a b]';  
    for j = 1:72
    A=Gery_prediction_data(j,:);  
    B=cumsum(A);  %ԭʼ�����ۼ�  
    n=length(A);  
    for i=1:(n-1)  
        C(i)=(B(i)+B(i+1))/2; %�����ۼӾ���  
    end  
    %�������������ֵ  
    D=A;D(1)=[];  
    D=D';  
    E=[-C;ones(1,n-1)];  
    c=inv(E*E')*E*D;  
    c=c';  
    a=c(1);b=c(2);  
    %Ԥ���������  
    F=[];F(1)=A(1);  
    for i=2:(n+1)  %ֻ�Ʋ��1�����ݣ����ԴӴ��޸�  
        F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a;  
    end  
    G=[];G(1)=A(1);  
    for i=2:(n+1)  %ֻ�Ʋ��1�����ݣ����ԴӴ��޸�  
        G(i)=F(i)-F(i-1);  %�õ�Ԥ�����������  
    end  
    t1=2001:2005;  
    t2=2001:2006;  %��1������  
    final(end+1)=G(6);
    end
   