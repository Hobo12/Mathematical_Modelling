for i=1:5
s=solve(x^2+y==i,x-y==0,x,y)
X(i)=s.x
Y(i)=s.y
end