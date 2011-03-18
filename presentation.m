function B = presentation(A,n)
% This function is used to convert the given set of elements A into the a
% set B which will be the subset of {0,1,2,....,n-1}.
an = length(A);B = [];
for i = 1:an
    if A(i,1) < 0
        b = n+rem(A(i,1),n);
    else
        b = rem(A(i,1),n);
    end
    B = [ B;b];
end
B = sort(B,'ascend');
