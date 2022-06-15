function A = form_A(input_A)
temps = size(input_A);
m=temps(1);n=temps(1)+temps(2);
A=zeros(m,n);
for i1=1:m
    for i2=1:n
        if i2<=temps(2)
            A(i1,i2)=input_A(i1,i2);
        elseif (i2-temps(2))==i1
            A(i1,i2)=1;
        else
            A(i1,i2)=0;
        end
    end
end
end

