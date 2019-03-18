close all;
clear all; 
d0=8; 
M=163;N=162; 
c1=floor(M/2); 
c2=floor(N/2); 
h1=zeros(M,N); %理想型??
h2=zeros(M,N); %巴特沃斯型??
h3=zeros(M,N); %高斯型??
sigma=4; 
n=4;%巴特沃斯阶数??
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
draw2(h1,'理想'); 
draw2(h2,'巴特沃斯'); 
draw2(h3,'高斯'); 
 
