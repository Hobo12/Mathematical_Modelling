x=[0]
for i=0:0.01:3
    for j=0:0.01:3
        for k=0:0.01:3
            for l=0:0.01:3
                for m=0:0.01:3
                    for n=0:0.01:3
                        if total([150 40 243+i;85 85 236+j;150 155 220.5+k;145 50 159+l;130 150 230+m;0 0 52+n])==1
                        else
                            x(1)=i
                            x(2)=j
                            x(3)=k
                            x(4)=l
                            x(5)=m
                            x(6)=n
                        end
                    end
                end
            end
        end
    end
end