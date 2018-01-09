function [px0,rel_err,r,e0]=gm11_test(x0,number)

%[px0,ab,rel]=gm11(x0,number)

%px0ΪԤ�����У�rel_errΪƽ��������,rΪ���ָ��

%Ĭ�ϵ�number����Ϊԭ�����С

x0=textread('data1.txt');

if nargin==1 %�������������жϣ��粻��һά�о��󣬽���ת�ñ任

number=max(size(x0));

end

n=max(size(x0)); %ȡ�������ݵ�������

x1=zeros(size(x0));

for k=1:n

for i=1:k

x1(k)=x1(k)+x0(i); %�����ۼ�ֵ������ֵ�������be

end

end

z=zeros(size(x0));

for k=2:n

z(k)=0.5*(x1(k)+x1(k-1)); %�������ݾ���B�ĵ�һ������

end

y=x0';

y(1)=[];

b(:,1)=-z';

b(:,2)=1;

b(1,:)=[];

ab=inv(b'*b)*b'*y; %������� ����

a=ab(1);

b=ab(2);

px0(1)=x0(1);

%����GM(1,1)ģ�͵�X1(k+1)ֵ

X1(1)=x0(1);

for k=1:n

X1(k+1)=(x0(1)-b/a)*exp(-(a)*k)+b/a;

end

%��ԭֵ��Ԥ����

px0(1)=x0(1);

for k=1:n

px0(k+1)=X1(k+1)-X1(k);

end

disp('Ԥ������Ϊ');

disp(px0(2:n+1));

%% ������ж�ģ�͵ľ���

%�в����

for k=1:n

e0(k)=px0(k)-x0(k);

end

epsilon=e0./x0; %������

epsilon=abs(epsilon);

rel_err=sum(epsilon)/(n-1)*100;

%�����ȼ���

p=0.5;

max_err=max(abs(e0));

r=0;

for k=1:n

r=r+p*max_err/(abs(e0(k))+p*max_err);

end

r=r/n; %r��ʾ������

str = sprintf( '������Ϊ %g%% ',r*100);

disp(str);

%����Ⱥ�С�����ʼ���

aver_e0=sum(e0)/n;%Ԥ������ֵ

aver_x0=sum(x0)/n;%ԭʼ���ݾ�ֵ

s1=sqrt(sum((x0-aver_x0).^2)/n);%ԭʼ���ݱ�׼��

s2=sqrt(sum((e0-aver_e0).^2)/n);%Ԥ�����ݱ�׼��

c=s2/s1; %�����

s0=0.6745*s1;

m=0;

for k=1:n

if abs(e0(k)-aver_e0)<s0

m=m+1;

end

end

P=m/n; %С������

str = sprintf( 'С������� p=%g ����� c=%g ',P,c);

disp(str);

if P>0.95&c<0.35

disp('Ԥ�⾫�Ⱥ�');

else if P>0.8&c<0.5

disp('Ԥ��ϸ�');

else if P>0.7&c<0.65

disp('Ԥ����ǿ�ϸ�');

else disp('Ԥ�ⲻ�ϸ�');

end

end

end