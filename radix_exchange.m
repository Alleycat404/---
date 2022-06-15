% clear;clc;
%% priliminary
format rat
k=4;l=8;
% A=[80 1 1 1 0 0 0 -1 0;
%     70 1 0 0 1 0 0 0 0;
%     45 0 1 0 0 1 0 0 0;
%     10 0 0 0 0 0 1 1 -1;
%     -80 -1 -1 0 0 0 0 1 0;
%     0 0 0 0 0 0 0 0 1;
%     -485 -5 -3 0 0 0 0 0 0;
%     0 0 0 0 0 0 0 1 0];
% temp=size(A);
% m=temp(1);n=temp(2);
%% operation of exchanging radix
A(k,1:n)=A(k,1:n)/A(k,l);
for i=1:m
    if i==k
        continue
    end
    temp=A(i,l)/A(k,l);    
    A(i,1:n)=A(i,1:n)-temp*A(k,1:n);
end
disp(A)