function a = eucl_algo(a,b)
% for finding the GCD of two no.s a,b with the help of Eulidean Algorithm.
X = [ ]; % initialising the matrix
i=1;
d = rem(a,b);
% a = q*b + d
while d ~= 0
    q = floor(a/b);
    d = rem(a,b);
    X(i,1) = a;
    X(i,2) = q;
    X(i,3) = b;
    X(i,4) = d;
    i = i +1;
    a = b;
    b = d;
    if d == 0
        break
    end
end

X