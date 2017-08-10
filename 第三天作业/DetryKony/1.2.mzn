var int:x1;
var int:x2;
var float:z;
constraint x1+x2<=100;
constraint x1<=x2;
constraint x1>=0;
constraint x2>=0;
constraint z=98*x1+277*x2-x1*x1-0.3*x1*x2-2*x2*x2;
solve maximize z;