enum veg={A1,A2,A3,A4,A5,A6};
array[veg] of float:fe=[0.45,0.45,0.65,0.4,0.5,0.5];
array[veg] of float:p=[20,28,40,25,26,75];
array[veg] of float:va=[415,4065,850,75,76,235];
array[veg] of float:vc=[22,5,43,27,48,8];
array[veg] of float:sour=[0.3,0.35,0.6,0.2,0.4,0.6];
array[veg] of float:price=[2.1,1.0,1.8,1.2,2.0,1.2];
array[veg] of var int:amt;
var float:cost;

constraint amt[A4]<=2;
constraint amt[A2]<=3;
constraint amt[A1]>=1;
constraint amt[A1]<=4;
constraint amt[A3]>=1;
constraint amt[A3]<=4;
constraint amt[A5]>=1;
constraint amt[A5]<=4;
constraint amt[A6]>=1;
constraint amt[A6]<=4;

constraint sum(i in veg)(amt[i]*fe[i])>=6;
constraint sum(i in veg)(amt[i]*p[i])>=125;
constraint sum(i in veg)(amt[i]*va[i])>=12500;
constraint sum(i in veg)(amt[i]*vc[i])>=345;
constraint sum(i in veg)(amt[i]*sour[i])>=5;
constraint sum(i in veg)(amt[i])=14; 
constraint cost=sum(i in veg)(amt[i]*price[i]);

solve minimize cost;




