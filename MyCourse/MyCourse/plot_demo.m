clear;
pi=3.14159;
t=0:0.1:2*pi;
y1=sin(t);
y2=sin(t+0.5);
y3=sin(t+1);
y4=cos(t);
y5=cos(t+0.5);
y6=cos(t+1);
plot(t,y1,'r',t,y4,'b--');
title('正弦和余弦曲线');
xlabel('时间'),ylabel('正弦、余弦');
figure;
subplot(1,3,1),plot(t,y1);
subplot(1,3,2),plot(t,y2);
subplot(1,3,3),plot(t,y3);
figure,plot(t,y5,'y*');
figure,plot(t,y6,'g');
%%
h=zeros(99,99); 
sigma=10; 
for i=1:99 
    for j=1:99
        d=sqrt((i-50)^2+(j-50)^2);        
        h(i,j)=exp(-d^2/(2*sigma^2));
    end
end 
figure;surf(h);