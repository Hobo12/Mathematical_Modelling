enum V={A1,A2,A3,A4,A5,A6};
enum N={T,L,A,C,Y};
var float:z;
array [N] of float:
demand=[6,125,12500,345,5];
array [V] of var int:x;
array [V,N] of float:
essence=[|0.45,20,415,22,0.3
         |0.45,28,4065,5,0.35
         |0.65,40,850,43,0.6
         |0.4,25,75,27,0.2
         |0.5,26,76,48,0.4
         |0.5,75,235,8,0.6|];
array [V] of float:p=[2.1,1.0,1.8,1.2,2.0,1.2];
constraint sum(i in V)(x[i])=14;
constraint x[A4]<=2;
constraint x[A4]>=0;
constraint x[A2]<=3;
constraint x[A2]>=0;
constraint x[A1]<=4;
constraint x[A1]>=1;
constraint x[A3]<=4;
constraint x[A3]>=1;
constraint x[A6]<=4;
constraint x[A6]>=1;
constraint x[A5]<=4;
constraint x[A5]>=1;
constraint forall(j in N)(sum(i in V)(x[i]*essence[i,j])>=demand[j]);
constraint z=sum(i in V)(x[i]*p[i]);
solve minimize z;