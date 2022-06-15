clear;clc
format rat
%% input information
A=[1 0 1 0 0 0;0 1 0 1 0 0;0 0 0 0 1 1;1 1 0 0 0 -1];
b=[70 45 10 80]';c=[0 0 5 3 0 0];

%% ************phase_1************

%% preparation
A=form_A(A);
A=expand_A(A,b);
temps=size(A);
M=temps(1);N=temps(2);
%% base variable
base=zeros(M-1,1);
for i0=1:M-1
    base(i0)=N-M+i0;
end
%% calculate
while 1
    for j=2:N
        if A(1,j)<0
            L=j;
            for i=2:M
                if A(i,j)>=0
                    zeta=A(i,1)/A(i,j);
                    K=i;
                    break
                end
            end
            for i=K:M
                if A(i,1)/A(i,j)<zeta&&A(i,j)>=0
                    zeta=A(i,1)/A(i,j);
                    K=i;
                end
            end
            base(K-1)=L-1;
            break
        end
    end
    A=OER(A,M,N,K,L);
%     disp('A=')
%     disp(A)
    if   A(1,2:N)>=0
        break
    end
end
%% get y_i out of basic variable
for k=1:M-1
    if base(k,1)<=N-M
        continue
    end
    for number=2:N
        if A(1+k,number)~=0
            base(k,1)=number-1;
            break
        end
    end
    A=OER(A,M,N,1+k,number);
end
if A(1,1)~=0
    disp('no finite optimal solution')
%     quit
end
%% show result of phase_1
disp('phase1_A=')
disp(A)

%% ************phase_2************

%% preparation
A=reform_A(A,base,c);
temps=size(A);
M=temps(1);N=temps(2);% M=length(b)+1;N=length(c)+1;
%% calculate
while 1
    if   A(1,2:N)>=0
        break
    end
    for j=2:N
        if A(1,j)<0
            L=j;
            count=0;
            for i=2:M
                if A(i,1)/A(i,j)<0
                    count=count+1;
                end
                if count==M-1
                    disp('no finite optimal solution')
%                     quit
                end
            end
            for i=2:M
                if A(i,j)>=0
                    zeta=A(i,1)/A(i,j);
                    K=i;
                    break
                end
            end
            for i=K:M
                if A(i,1)/A(i,j)<zeta&&A(i,j)>=0
                    zeta=A(i,1)/A(i,j);
                    K=i;
                end
            end
            base(K-1)=L-1;
            break
        end
    end
    A=OER(A,M,N,K,L);
%     disp('A=')
%     disp(A)
end
%% show result of phase_2
disp('phase2_A=')
disp(A)

%% **********reach result**********

X=zeros(length(c),1);
for k=1:length(c)
    for number=1:length(base)
        if base(number)==k
            X(k)=A(number+1,1);
            continue
        end
    end
end
S=c*X;
disp('X=')
disp(X)
disp('S=')
disp(S)








