enum c={S0,S1,S2,S3,S4};
enum t={r,q,p,u};
array [c,t] of float:
essence=[|0.05,0,0,0
         |0.28,0.025,0.01,103
         |0.21,0.015,0.02,198
         |0.23,0.055,0.045,52
         |0.25,0.026,0.065,40|];
array [c] of var float:x;
var float:P;
var float:R;
var float:RISK;
var float:result;
float: M=1000;
float: s;

constraint M=sum(i in c)(x[i]);
constraint R=sum(i in c)(x[i]*essence[i,r]);
constraint P=sum(i in c)((x[i]>essence[i,u])*x[i]*essence[i,p]+(x[i]<=essence[i,u])*essence[i,u]*essence[i,p]);
constraint RISK=sum(i in c)(x[i]*essence[i,q]);
constraint forall(i in c)(x[i]>=0);
constraint result=s*RISK-(1-s)*(R-P);
solve minimize result;
