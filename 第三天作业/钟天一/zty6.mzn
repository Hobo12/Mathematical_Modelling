array[1..5,1..5] of int:x=array2d(1..5,1..5,[8,6,10,9,12,9,12,7,11,9,7,4,3,5,8,9,5,8,11,8,4,6,7,5,11]);
array[1..5,1..5] of var int:y;

var int:totaltime;

constraint forall(i in 1..5)(forall(j in 1..5)(y[i,j]>=0));
constraint forall(i in 1..5)(sum(j in 1..5)(y[i,j])=1);
constraint forall(j in 1..5)(sum(i in 1..5)(y[i,j])=1);

constraint totaltime=sum(i in 1..5)(sum(j in 1..5)(x[i,j]*y[i,j]));

solve minimize totaltime;