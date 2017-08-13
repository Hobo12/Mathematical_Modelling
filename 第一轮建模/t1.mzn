
array[1..7] of int:s = [800,800,1000,2000,2000,2000,3000];
array[1..7] of int:p = [160,155,155,160,155,150,160];
array[1..7,1..15] of float:fare=
[|170.7,160.3,140.2,98.6,38,20.5,3.1,21.2,64.2,92,96,106,121.2,128,142
|215.7,205.3,190.2,171.6,111,95.5,86,71.2,114.2,142,146,156,171.2,178,192
|230.7,220.3,200.2,181.6,121,105.5,96,86.2,48.2,82,86,96,111.2,118,132
|260.7,250.3,235.2,216.6,156,140.5,131,116.2,84.2,62,51,61,76.2,83,97
|255.7,245.3,225.2,206.6,146,130.5,121,111.2,79.2,57,33,51,71.2,73,87
|265.7,255.3,235.2,216.6,156,140.5,131,121.2,84.2,62,51,45,26.2,11,28
|275.7,265.3,245.2,226.6,166,150.5,141,131.2,99.2,76,66,56,38.2,26,2|];
array[1..15] of var int:amt;%每个Ai分配的钢材量
array[1..28] of var int:w;%A1到A28之间分了的28段
array[1..14] of int:everydistance=[104,301,750,606,194,205,201,680,480,300,220,210,420,500];

array[1..7,1..15] of var int:choiceamt;%Si送到Aj的钢材量
var float:Fare1;%在管道以外运送的总费用
var float:Fare2;%在管道上运送的总费用
var float:Fare3;%购买钢材的总费用
var float:totalcost;



constraint forall(i in 1..28)(w[i]>=0);
constraint forall(i in 1..14)(w[2*i-1]+w[2*i]=everydistance[i]);
constraint w[1]=amt[1];
constraint forall(i in 1..13)(w[2*i]+w[2*i+1]=amt[i+1]);
constraint w[28]=amt[15];

constraint forall(i in 1..7)(forall(j in 1..15)(choiceamt[i,j]>=0));
constraint forall(j in 1..15)(sum(i in 1..7)(choiceamt[i,j])=amt[j]);
constraint forall(i in 1..7)(sum(j in 1..15)(choiceamt[i,j])>=500);
constraint forall(i in 1..7)(sum(j in 1..15)(choiceamt[i,j])<=s[i]);
constraint Fare1=sum(i in 1..7)(sum(j in 1..15)(choiceamt[i,j]*fare[i,j]));
constraint Fare2=sum(i in 1..28)(w[i]*(w[i]+1)/2*0.1);
constraint Fare3=sum(i in 1..7)(sum(j in 1..15)(choiceamt[i,j]*p[i]));
constraint totalcost=Fare1+Fare2+Fare3;

solve minimize totalcost;

