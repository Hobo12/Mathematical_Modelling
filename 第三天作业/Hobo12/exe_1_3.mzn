array[1..6,1..6] of var int:x;
array[1..6,1..6] of int:r=
[|1,1,0,0,0,0
 |1,1,1,0,0,0
 |0,0,1,0,1,1
 |0,0,1,1,0,0
 |0,0,0,1,1,1
 |0,0,1,0,1,1|];
 var int: z;
 
 constraint sum(i in 1..6)(x[i,i])=3;
 constraint forall(j in 1..6)(sum(i in 1..6)(x[i,j])<=1);
 constraint forall(i in 1..6)(forall(j in 1..6)(x[i,j]<=x[i,i]));
 constraint forall(i in 1..6)(forall(j in 1..6)(x[i,j]>=0));
 constraint forall(i in 1..6)(forall(j in 1..6)(x[i,j]<=1));
 constraint z = sum(i in 1..6)(sum(j in 1..6)(x[i,j]*r[i,j]));
 
 solve maximize z;