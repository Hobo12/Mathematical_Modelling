array [1..6,1..6] of int:
fee=[|0,720,454,842,2396,1196
     |702,0,324,1093,2136,764
     |454,324,0,1137,2180,798
     |842,1093,1137,0,1616,1857
     |2396,2136,2180,1616,0,2900
     |1196,764,798,1857,2900,0|];
array [1..6] of var 1..6:x;
var int:z;
constraint forall(i,j in 1..6 where i<j)(x[i]!=x[j]);
constraint z=sum(i in 1..5)(fee[x[i],x[i+1]])+fee[x[6],x[1]];
solve minimize z;