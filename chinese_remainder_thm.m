function  [ X0 M] = chinese_remainder_thm(A)
% this function will return the value of 'x' which satisfies the given set
% of congurence relations given by x = a(i) mod(m(i)).
%The matrix A is nx2 matrix first row of which contains all a(i) and second
%column contains corresponding m(i).
%The generalised  ans is  x = X0 mod(M).
%The functions my_gcd.m should be defined in the directory
%The function extended_euclidean_algo.m should be defined in the directory
% The function before_crm.m should be defined in the directory.

    an = size(A,1);
    M = prod(A(:,2));
    X0 = 0;%intialising the final ans
    for i = 1:an
        M_i = M/A(i,2);
        [ g r s] = extended_euclidean_algo(M_i,A(i,2));
        if g ~= 1
            disp('All the m(i)s should be co-prime to each other');
            return
        end
        X0 = X0 + M_i*r*A(i,1);
    end
    fprintf( '  x congruent %4i mod%5i\n',X0,M)
end