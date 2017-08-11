set of int: place = 1..6;
array[place,place] of int:fare=
[|0,720,454,842,2396,1196
 |702,0,324,1093,2136,764
 |454,324,0,1137,2180,798
 |842,1093,1137,0,1616,1857
 |2396,2136,2180,1616,0,2900
 |1196,764,798,1857,2900,0|];
var int:total;
 
array[1..length(place)+1] of var place:direction; 

constraint direction[length(place)+1]=direction[1];
constraint forall(i,j in place where i<j)(direction[i]!=direction[j]);
constraint total = sum(i in place)(fare[direction[i],direction[i+1]]);

solve minimize total;