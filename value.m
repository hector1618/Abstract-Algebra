function k = value(f,x)
%to return the value of fucntion at x
fn = size(f,1);
k=0;
for i=1:fn
    k=k+f(i,1)*x^f(i,2);
end
end