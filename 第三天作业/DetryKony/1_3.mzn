array [1..6,1..6] of var int:x;
var int:z;
array[1..6,1..6] of int: 
r=[|1,1,0,0,0,0
   |1,1,1,0,0,0
   |0,0,1,0,1,1
   |0,0,1,1,0,0
   |0,0,0,1,1,1
   |0,0,1,0,1,1|];
constraint sum(i in 1..6)(x[i,i])=3;
constraint forall(j in 1..6)(sum(i in 1..6)(x[i,j])<=1);
constraint forall(j in 1..6)(forall(i in 1..6)(x[i,j]<=x[i,i]));
constraint forall(j in 1..6)(forall(i in 1..6)(0<=x[i,j]));
constraint forall(j in 1..6)(forall(i in 1..6)(x[i,j]<=1));
constraint z=sum(i in 1..6,j in 1..6)(x[i,j]*r[i,j]);
solve maximize z;
