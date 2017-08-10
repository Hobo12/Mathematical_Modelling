enum people={p1,p2,p3,p4,p5};
enum task={A,B,C,D,E};
array [people,task] of int:
essence=[|8,6,10,9,12
         |9,12,7,11,9
         |7,4,3,5,8
         |9,5,8,11,8,
         |4,6,7,5,11|];
var int:z;
array [people,task] of var int:x;
constraint forall(i in people)(forall(j in task)(x[i,j]>=0));
constraint forall(j in task)(sum(i in people)(x[i,j])=1);
constraint forall(i in people)(sum(j in task)(x[i,j])=1);
constraint z=sum(j in task)(sum(i in people)(x[i,j]*essence[i,j]));
solve minimize z;