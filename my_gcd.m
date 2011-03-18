function g = my_gcd(a,b)
% for finding the GCD of two no.s a,b with the help of Eulidean Algorithm.
d = 1;% just to start a loop
% a = q*b + d
while d ~= 0
    q = floor(a/b);
    d = rem(a,b);
    a = b;
    b = d;
    if d == 0
        g = a;
        break
    end
end