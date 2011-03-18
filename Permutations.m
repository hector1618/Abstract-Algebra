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