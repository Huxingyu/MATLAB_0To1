close all;
clear all; 
d0=8; 
M=163;N=162; 
c1=floor(M/2); 
c2=floor(N/2); 
h1=zeros(M,N); %������??
h2=zeros(M,N); %������˹��??
h3=zeros(M,N); %��˹��??
sigma=4; 
n=4;%������˹����??
for i=1:M 
    for j=1:N
        d=sqrt((i-c1)^2+(j-c2)^2);
        if d<=d0
            h1(i,j)=1;
        else
            h1(i,j)=0;
        end
        h2(i,j)=1/(1+(d/d0)^(2*n));
        h3(i,j)=exp(-d^2/(2*sigma^2));
    end
end 
draw2(h1,'����'); 
draw2(h2,'������˹'); 
draw2(h3,'��˹'); 
 
