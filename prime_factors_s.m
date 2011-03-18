function A = prime_factors_s(n)
% This function returns the matrix with all the prime factors the no
% posseses. It will return the nx2 matrix A which contains first entry 
%in the row will be prime and second will be its exponent. 
%The function primes_to_n should be defined in the directory
%The prime.mat file should be present in the directory
load prime.mat
%B = primes_to_n(n);
k = n;
i = 1;
A = [];
while k > 1
		if rem(k, B(1,i)) == 0
            j = 0;
            while rem(k,B(1,i)) == 0
                k = k/B(1,i);
                j = j +1;
            end
            A = [ A ; B(1,i)  j];
        end
        i = i + 1;
end
