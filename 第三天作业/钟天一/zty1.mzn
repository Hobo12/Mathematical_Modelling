
var float: X;
var float: Y;
var float: Z;
constraint 4*X+3*Y<=10.0;
constraint 3*X+5*Y<=12.0;
constraint X>=0.0;
constraint Y>=0.0;
constraint Z=2*X+3*Y;

solve maximize Z;
output["X=\(X),Y=\(Y),Z=\(Z)"];
