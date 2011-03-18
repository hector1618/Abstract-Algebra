function X= hd_prime(f,p)
%This program is to solve f(x) congruent to 0 mod p where p is a prime
%number.f is a nx2 matrix in which first element is coeffiecint of x^n and
%second entry contains the power. i.e. for euqation x^7+13*x^3+6 the
%corresponding f will be  f = [ 1,7; 13,3; 6,0];
X = [];%matrix containg the final answer
for i=0:p-1
    k = value(f,i);
    if rem(k,p)==0
        X = [X i];
    end
end
xm = size(X,2);
if xm == p
    disp('This is a congruence identity');
else
    if xm==0
        disp('No solution for given congruence');
    end
end
end

function k = value(f,x)
%to return the value of fucntion at x
fn = size(f,1);
k=0;
for i=1:fn
    k=k+f(i,1)*x^f(i,2);
end
end