function A=reform_A(inputA,base,c)
temps=size(inputA);
m=temps(1);n=temps(2)-(m-1);
%% form cB
cB=zeros(1,length(base));
for i=1:length(base)
    cB(i)=c(base(i));
end
%% form P
P=zeros(m-1,n);
for i=1:m-1
    for j=1:n
        P(i,j)=inputA(i+1,j);
    end
end
%% calculate
A=zeros(m,n);
for i=m:-1:1
    for j=n:-1:1
        if i~=1
            A(i,j)=inputA(i,j);
        elseif i==1&&j==1
            A(i,j)=-cB*P(:,j);
        else
            A(i,j)=c(j-1)-cB*P(:,j);
        end
    end
end
end
        
