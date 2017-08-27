function [px0,rel_err,r,e0]=gm11_test(x0,number)

%[px0,ab,rel]=gm11(x0,number)

%px0为预测数列，rel_err为平均相对误差,r为相关指数

%默认的number参数为原数组大小

x0=textread('data1.txt');

if nargin==1 %对输入矩阵进行判断，如不是一维列矩阵，进行转置变换

number=max(size(x0));

end

n=max(size(x0)); %取输入数据的样本量

x1=zeros(size(x0));

for k=1:n

for i=1:k

x1(k)=x1(k)+x0(i); %计算累加值，并将值赋予矩阵be

end

end

z=zeros(size(x0));

for k=2:n

z(k)=0.5*(x1(k)+x1(k-1)); %计算数据矩阵B的第一列数据

end

y=x0';

y(1)=[];

b(:,1)=-z';

b(:,2)=1;

b(1,:)=[];

ab=inv(b'*b)*b'*y; %计算参数 矩阵

a=ab(1);

b=ab(2);

px0(1)=x0(1);

%计算GM(1,1)模型的X1(k+1)值

X1(1)=x0(1);

for k=1:n

X1(k+1)=(x0(1)-b/a)*exp(-(a)*k)+b/a;

end

%求还原值及预测结果

px0(1)=x0(1);

for k=1:n

px0(k+1)=X1(k+1)-X1(k);

end

disp('预测序列为');

disp(px0(2:n+1));

%% 检验和判断模型的精度

%残差检验

for k=1:n

e0(k)=px0(k)-x0(k);

end

epsilon=e0./x0; %相对误差

epsilon=abs(epsilon);

rel_err=sum(epsilon)/(n-1)*100;

%关联度检验

p=0.5;

max_err=max(abs(e0));

r=0;

for k=1:n

r=r+p*max_err/(abs(e0(k))+p*max_err);

end

r=r/n; %r表示关联度

str = sprintf( '关联度为 %g%% ',r*100);

disp(str);

%方差比和小误差概率检验

aver_e0=sum(e0)/n;%预测误差均值

aver_x0=sum(x0)/n;%原始数据均值

s1=sqrt(sum((x0-aver_x0).^2)/n);%原始数据标准差

s2=sqrt(sum((e0-aver_e0).^2)/n);%预测数据标准差

c=s2/s1; %方差比

s0=0.6745*s1;

m=0;

for k=1:n

if abs(e0(k)-aver_e0)<s0

m=m+1;

end

end

P=m/n; %小误差概率

str = sprintf( '小概率误差 p=%g 方差比 c=%g ',P,c);

disp(str);

if P>0.95&c<0.35

disp('预测精度好');

else if P>0.8&c<0.5

disp('预测合格');

else if P>0.7&c<0.65

disp('预测勉强合格');

else disp('预测不合格');

end

end

end