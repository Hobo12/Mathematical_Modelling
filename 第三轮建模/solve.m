T=60;
A=zeros(5,T+40);
B=zeros(5,T);
amount=zeros(1,T+40);%占用的病床数
N=[100,134,64,170,64];
j=1;
while(j~=0)%产生随机病人表
for i=1:1:5
    B(i,:)=illness(N(i),T);
end
if sum(B(1,:))==N(1) && sum(B(2,:))==N(2) && sum(B(3,:))==N(3) && sum(B(4,:))==N(4) && sum(B(5,:))==N(5)
    j=0;
end
end
C=zeros(5,T+1);
for t=1:1:T
    C(:,t)=B(:,t);
end

for j=1:1:T
    for i=5:-1:1%外伤优先安排
        for m=C(i,j):-1:1
            for k=j:1:j+days(i,j)
                if amount(j)<79
                    A(i,k)=A(i,k)+1;
                    amount(k)=amount(k)+1;
                else
                    C(i,j+1)=C(i,j+1)+m;
                    break
                end
            end
            if amount(j)==79
                break
            end
        end
        if amount(j)==79
                break
        end
    end
end
