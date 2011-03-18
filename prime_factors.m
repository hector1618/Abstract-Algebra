function A = prime_factors(n)
% This function returns the matrix with all the prime factors the no
% posseses
%The function primes_to_n should be defined in the directory
%The prime.mat file should be present in the directory
load prime.mat
%B = primes_to_n(n);
k = n;
i = 1;
A = [];
while k > 1
		if rem(k, B(1,i)) == 0
                k = k/B(1,i);
               A = [A B(1,i)];
        else
            i = i + 1;
        end
        
        if(i==length(B))
            if is_it_prime(k)==1
                A = [A k];
            else
                disp('Too big number for this function');
                disp('Some of the prime factors are');  
            end
            break
        end
end
