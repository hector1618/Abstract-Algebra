function X = linear_equation(a,b,m)
% This function is used to solve an equation ax = b mod(m)
%It returns the matrix X which contains all the solutions distict mod(m)
%The function my_gcd.m should be defined in the directory
%The funciton extended_euclidean_algo.m should be defined in the directory
% The fucntion presentation.m should be defined in the directory
[g r s ] = extended_euclidean_algo(a,m);
X = [];
if m == 1
    disp('mod 1 ?!?!?! are u kidding ');
    return
end

if rem(b,g) ~= 0
    disp('No solution for given equation');
    return
end
x0 = r*b/g;% this is intitial solutin
for t = 0:g-1
    y0 = x0 + t*m/g;
    X = [ X ; y0];
end
X = presentation(X,m);
X = X';% just changing the form of output
