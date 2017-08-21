array[1..5,1..60] of var int:start;
array[1..5,1..60] of var int:duration;
array[1..5] of int:period=[5,7,11,13,7];

constraint forall(i in 1..5)(forall(j in 1..30)(start[i,j]>=0));
constraint forall(j in 1..30 where j mod 7 !=0 /\ j mod 7 !=6)(start[1,j]=0);
constraint forall(j in 1..30 where j mod 7 !=6)(start[2,j]=0);
constraint forall(j in 1..30 where j mod 7 !=0 /\ j mod 7 !=5)(start[3,j]=0);
constraint forall(j in 1..30 where j mod 7 !=0 /\ j mod 7 !=5)(start[4,j]=0);
constraint forall(i in 1..5)(forall(j in 31..60)(start[i,j]=0));
constraint sum(j in 1..30)(start[1,j])=47;
constraint sum(j in 1..30)(start[2,j])=62;
constraint sum(j in 1..30)(start[3,j])=29;
constraint sum(j in 1..30)(start[4,j])=79;
constraint sum(j in 1..30)(start[5,j])=30;


constraint forall(j in 1..5)(duration[1,j]=sum(k in 1..j)(start[1,k]));
constraint forall(j in 6..60)(duration[1,j]=sum(k in j-4..j)(start[1,k]));

constraint forall(j in 1..7)(duration[2,j]=sum(k in 1..j)(start[2,k]));
constraint forall(j in 8..60)(duration[2,j]=sum(k in j-6..j)(start[2,k]));

constraint forall(j in 1..11)(duration[3,j]=sum(k in 1..j)(start[3,k]));
constraint forall(j in 12..60)(duration[3,j]=sum(k in j-10..j)(start[3,k]));

constraint forall(j in 1..13)(duration[4,j]=sum(k in 1..j)(start[4,k]));
constraint forall(j in 14..60)(duration[4,j]=sum(k in j-12..j)(start[4,k]));

constraint forall(j in 1..7)(duration[5,j]=sum(k in 1..j)(start[5,k]));
constraint forall(j in 8..60)(duration[5,j]=sum(k in j-6..j)(start[5,k]));

constraint forall(j in 1..60)(sum(i in 1..5)(duration[i,j])<=79);

solve minimize max(i in 1..5,j in 1..30 where start[i,j]!=0)(j+period[i]-1);