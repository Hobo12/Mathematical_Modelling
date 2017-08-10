enum task = {A,B,C,D,E};
enum people = {jia,yi,bin,ding,wu};
array[people,task] of int:time =
[|8,6,10,9,12
 |9,12,7,11,9
 |7,4,3,5,8
 |9,5,8,11,8
 |4,6,7,5,11|];
 array[people,task] of var bool:decision;
 var int:total;
 
 constraint forall(j in task)(sum(i in people)(decision[i,j])=1);
 constraint forall(i in people)(sum(j in task)(decision[i,j])=1);
 constraint total = sum(i in people)(sum(j in task)(decision[i,j]*time[i,j]));
 
 solve minimize total;