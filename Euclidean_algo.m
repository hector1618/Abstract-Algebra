function a = Euclidean_algo(a,b)
% for finding the GCD of two no.s a,b with the help of Eulidean Algorithm.
d = rem(a,b);
% a = q*b + d
while d ~= 0
    q = floor(a/b);
    d = rem(a,b);
    a = b;
    b = d;
    if d == 0
        break
    end
end