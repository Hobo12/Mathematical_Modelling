%Variable
var float: x;
var float: y;
var float: z;

%Constraint
constraint 4*x+3*y<=10;
constraint 3*x+5*y<=12;
constraint x>=0;
constraint y>=0;
constraint z=2*x+3*y;
%maximize
solve maximize z;