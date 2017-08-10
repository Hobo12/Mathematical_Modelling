var float: total;

enum V = {A1,A2,A3,A4,A5,A6};
array[V] of float:price = [2.1,1.0,1.8,1.2,2.0,1.2];
array[V] of var int: supply;

enum N = {Fe,P,VA,VC,S};
array[N] of float:requirement = [6,125,12500,345,5];

array[V,N] of float:
nutrition =
[|0.45,20,415,22,0.3
 |0.45,28,4065,5,0.35
 |0.65,40,850,43,0.6
 |0.4,25,75,27,0.2
 |0.5,26,76,48,0.4
 |0.5,75,235,8,0.6|];
 
 constraint supply[A4]<=2;
 constraint supply[A2]<=3;
 constraint supply[A4]>=0;
 constraint supply[A2]>=0;
 
 constraint supply[A1]>=1;
 constraint supply[A1]<=4;
 constraint supply[A3]>=1;
 constraint supply[A3]<=4;
 constraint supply[A5]>=1;
 constraint supply[A5]<=4;
 constraint supply[A6]>=1;
 constraint supply[A6]<=4;
 
 constraint forall(j in N)(sum(i in V)(supply[i]*nutrition[i,j])>=requirement[j]);
 
 constraint total = sum(i in V)(price[i]*supply[i]);
 
 solve minimize total;