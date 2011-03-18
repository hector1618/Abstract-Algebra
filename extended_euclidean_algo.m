function [g,r,s] = extended_euclidean_algo(a,b)
%This function will return the values of g = gcd(a,b) and (r,s) such that a*r + b*s = g
% 'r' is corresponding to 'a' and 's' is corresponsing to 'b'
r = 0;
r1 = 1;
s = 1;
s1 = 0;
while b ~= 0
       q = floor(a/b);     
       t = b;
       b = rem(a,b);
       a = t;
       t = r;
       r = r1-q*r;
       r1 = t;
       t = s;
       s = s1-q*s;
       s1 = t;
end
g = a;
r = r1;
s = s1;