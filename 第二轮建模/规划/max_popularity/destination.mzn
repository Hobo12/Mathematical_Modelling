array[1..10] of int:acs=[18,18,4,6,6,16,12,6,16,8];
array[1..10] of float:pcs;
array[1..10] of int:amtcs;
array[1..10] of var int:cs;

array[1..10] of int:aeco=[8,4,4,4,6,6,6,8,6,4];
array[1..10] of float:peco;
array[1..10] of int:amteco;
array[1..10] of var int:eco;

array[1..10] of int:amath=[12,38,52,8,24,34,12,6,24,12];
array[1..10] of float:pmath;
array[1..10] of int:amtmath;
array[1..10] of var int:math;

array[1..10] of int:aeng=[40,4,2,22,8,16,6,6,10,6];
array[1..10] of float:peng;
array[1..10] of int:amteng;
array[1..10] of var int:eng;

array[1..8] of int:adouble=[4,10,8,10,6,8,12,14];
array[1..8] of float:pdouble;
array[1..8] of int:amtdouble;
array[1..8] of var int:double;

array[1..6] of int:amech=[18,4,10,16,4,8];
array[1..6] of float:pmech;
array[1..6] of int:amtmech;
array[1..6] of var int:mech;

array[1..6] of int:ache=[4,4,4,4,4,10];
array[1..6] of float:pche;
array[1..6] of int:amtche;
array[1..6] of var int:che;

array[1..6] of int:ageo=[8,8,8,8,4,4];
array[1..6] of float:pgeo;
array[1..6] of int:amtgeo;
array[1..6] of var int:geo;

array[1..6] of int:aenviro=[8,10,8,6,4,4];
array[1..6] of float:penviro;
array[1..6] of int:amtenviro;
array[1..6] of var int:enviro;

array[1..9] of int:maxtotal=[114,114,120,102,111,72,44,63,72];
array[1..9] of var int:total;

var float:totalprofit;


constraint forall(i in 1..10)(cs[i]>=1/2*acs[i]);
constraint forall(i in 1..10)(eco[i]>=1/2*aeco[i]);
constraint forall(i in 1..10)(math[i]>=1/2*amath[i]);
constraint forall(i in 1..10)(eng[i]>=1/2*aeng[i]);
constraint forall(i in 1..8)(double[i]>=1/2*adouble[i]);
constraint forall(i in 1..6)(mech[i]>=1/2*amech[i]);
constraint forall(i in 1..6)(che[i]>=1/2*ache[i]);
constraint forall(i in 1..6)(geo[i]>=1/2*ageo[i]);
constraint forall(i in 1..6)(enviro[i]>=1/2*aenviro[i]);

constraint total[1]=sum(i in 1..10)(cs[i]);
constraint total[2]=sum(i in 1..10)(eco[i]);
constraint total[3]=sum(i in 1..10)(math[i]);
constraint total[4]=sum(i in 1..10)(eng[i]);
constraint total[5]=sum(i in 1..8)(double[i]);
constraint total[6]=sum(i in 1..6)(mech[i]);
constraint total[7]=sum(i in 1..6)(che[i]);
constraint total[8]=sum(i in 1..6)(geo[i]);
constraint total[9]=sum(i in 1..6)(enviro[i]);
constraint forall(i in 1..9)(total[i]<=maxtotal[i]);

constraint totalprofit=sum(i in 1..10)(pcs[i]*cs[i]*amtcs[i])+sum(i in 1..10)(peco[i]*eco[i]*amteco[i])+sum(i in 1..10)(pmath[i]*math[i]*amtmath[i])+sum(i in 1..10)(peng[i]*eng[i]*amteng[i])+sum(i in 1..8)(pdouble[i]*double[i]*amtdouble[i])+sum(i in 1..6)(pmech[i]*mech[i]*amtmech[i])+sum(i in 1..6)(pche[i]*che[i]*amtche[i])+sum(i in 1..6)(pgeo[i]*geo[i]*amtgeo[i])+sum(i in 1..6)(penviro[i]*enviro[i]*amtenviro[i]);


solve maximize totalprofit;