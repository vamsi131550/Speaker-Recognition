clear all
q=length(X);
w=length(c);
if(q>w)
    c=[c,zeros(1,q-w)];
elseif(q==w);
        c=c;X=X;
else
    X=[X,zeros(1,w-q)]
end
b=X*transpose(c);
s=X*transpose(X);
d=c*transpose(c);
v=(b/sqrt(s*d))*100