function A = OER(A,m,n,k,l)  % operation of exchanging radix
A(k,1:n)=A(k,1:n)/A(k,l);
for i=1:m
    if i==k
        continue
    end
    temp=A(i,l)/A(k,l);
    A(i,1:n)=A(i,1:n)-temp*A(k,1:n);
end
end

