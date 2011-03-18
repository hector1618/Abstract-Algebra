function X = hd_anynumber(f,n)
%This program is to solve f(x) congruent to 0 mod n where n is any number
%f is a nx2 matrix in which first element is coeffiecint of x^n and
%second entry contains the power. i.e. for euqation x^7+13*x^3+6 the
%corresponding f will be  f = [ 1,7; 13,3; 6,0];
%the function hd_primepower.m should be defined in the directory
%the function prime_factors_s.m should be defined in the domain
%The function chinese_remainder_thm.m should be defined in the domain
X = [];%This will contain the final ans
P = prime_factors_s(n);
pm = size(P,1);
X1 = [];% This will contain all the solutions which came by solving individual 
%prime module
U = [];%This will contain all the upper limit of the indices
L = [1];% This will contain all the lowe limit of indices
u = 0;%This will be used to built U and L
t = 1; %This will measure the total number of solutins
for i = 1:pm
    p = P(i,1);
    e = P(i,2);
    X_ind = hd_primepower_s(f,p,e);%solution of individual p^e
    xn = size(X_ind,2);
    if xn == 0
        disp(' NO SOLUTION');
        return
    else
        t = t*xn;
        u = u + xn;
        U = [U  u];
        L = [ L u+1];
        X1 = [ X1 X_ind];
    end
end
L(:,end) = [];%removing the last element which is a sideproduct of formation

%Till this step we formed the solution for f(x) congruent to 0 mod (p^e) for
% all the factors of n. Now we have to get the solutions for mod(n) using
% chinese_remainder_thm but for that we need to pair the optained solution
Prm = Permutations(L,U,t);
Prm_m = size(Prm,1);
%For chinese remainder thm
A(:,2) = P(:,1);%This will be fixed
for i = 1:Prm_m
    A(:,1) = X1(Prm(i,:))';
    x = chinese_remainder_thm_s(A);
    X = [ X x];
end
X = presentation(X',n);
X = X'; %just a presentation part
end

function Prm  = Permutations(L,U,t)
I = L;%This will hold current indices
Prm= I;
i1 = 1;
while i1 < t
    I = next(I,L,U);
    Prm = [ Prm; I];
    i1=i1+1;
end

%defining subfunction of Permutations
function I = next(I,L,U)
    i = length(L);
    while I(1,i) == U(1,i)
        i = i -1;
        if i==0
            return
        end
    end
    I(1,i) = I(1,i)+1;
    I(1,i+1:end)=L(1,i+1:end);
end
end