function A = expand_A(inputA,b)
temps=size(inputA);
A=zeros(temps(1)+1,temps(2)+1);
m=temps(1)+1;n=temps(2)+1;
for i0=m:-1:1
    for i1=n:-1:1
        if i0~=1&&i1~=1
            A(i0,i1)=inputA(i0-1,i1-1);
        elseif i0~=1&&i1==1
            A(i0,i1)=b(i0-1);
        elseif i0==1&&i1>n-temps(1)
            A(i0,i1)=0;
        else
            A(i0,i1)=0;
            for i=2:m
                A(i0,i1)=A(i0,i1)-A(i,i1);
            end
        end
    end
end
end

