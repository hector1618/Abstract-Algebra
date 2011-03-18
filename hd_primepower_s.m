function X = hd_primepower_s(f,p,e)
%THIS IS SPECIAL FUNCTION WHICH TAKES 'p' AND 'e' AS INPUT ARGUMENT
%This program is to solve f(x) congruent to 0 mod n where n is of the form p^e and p is a prime
%number and e is +ve interger. f is a nx2 matrix in which first element is coeffiecint of x^n and
%second entry contains the power. i.e. for euqation x^7+13*x^3+6 the
%corresponding f will be  f = [ 1,7; 13,3; 6,0];
%the function linear_euqation.m should be defined in the directory
%the function prime_factors.m should be defined in the domain
%the function hd_prime.m should be defined in the domain

X = [];%matrix containg the final answer
X1 = hd_prime_s(f,p);%matrix containing the basic ans from where we will generate the answers 
x1n = size(X1,2);
if x1n == 0
    return
end
S = [ X1' ones(x1n,1)];%formation of stack
sm = size(S,1);%depth of stack
while sm ~= 0   
    [x,s,S] = pop(S); %S will be reduced by 1 column
    s = s+1;
    if s == e+1
        X = [ X x];
    else
        V = get_above(x,s,p,f);
        vn = size(V,2);
        if (vn == 0)
            sm = size(S,1);
            continue
        else
            for i = 1:vn
                x_abv = x + V(1,i)*p^(s-1);
                S = push(x_abv,s,S);
            end
        end
    end
    sm = size(S,1);
end
end

function S = push(val, ind, S)
%adds the entry to the topmost column to the existing stack
S = [val,ind ;S];
end

function [val  ind S] = pop(S)
%returns the topmost entry in the stack and removes it
val= S(1,1);
ind = S(1,2);
S(1,:) = [];
end

function  V = get_above(x,s,p,f)
%we need v to proceed to go to next layer. i.e. a layer  above
%v can be obtained by looking at some possible solutins of av congruent
%b modulo p.where a and b will be
f_f = diff(f);%finding the differtiation of the given function
a = value(f_f,x);
b = value(f,x);
b = -b/p^(s-1);
V = linear_equation_s(a,b,p);%V containg all the solutions of the given linear equation.
end

%finding f'
function f_f = diff(f)
%this returns the matrix which is the differentiation of matrix f
fn = size(f,1);
for i=1:fn
    f_f(i,1)=f(i,1)*f(i,2);
    f_f(i,2)=f(i,2)-1;
end
if f_f(fn,2)== -1
    f_f(fn,:) = [];
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