q=length(x);
w=length(c);
if(q>w)
    c=[c,zeros(1,q-w)];
elseif(q==w);
        c=c;
        x=x;
else
     x=[x,zeros(1,w-q)];
end
z = intersect(x,c)
K = dsearchn(c,x)