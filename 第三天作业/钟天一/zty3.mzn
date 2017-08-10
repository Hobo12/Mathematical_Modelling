array[1..6,1..6] of int:r=array2d(1..6,1..6,[1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,1,1,0,0,1,1,0,0,0,0,0,1,1,1,0,0,1,0,1,1]);
array[1..6,1..6] of var int:x;
var int:z;

constraint sum(i in 1..6)(x[i,i])=3;
constraint forall(j in 1..6)(sum(i in 1..6)(x[i,j])<=1);
constraint forall(j in 1..6)(forall(i in 1..6)(x[i,j]<=x[i,i]));
constraint forall(j in 1..6)(forall(i in 1..6)(x[i,j]<=1));
constraint forall(j in 1..6)(forall(i in 1..6)(x[i,j]>=0));
constraint z=sum(i in 1..6)(sum(j in 1..6)(x[i,j]*r[i,j]));

solve maximize z;

