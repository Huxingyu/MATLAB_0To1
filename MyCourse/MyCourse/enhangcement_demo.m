%% 直方图均匀化
I=imread('pout.tif');  % 读取MATLAB自带的potu.tif图像
[J,T]=histeq(I);      % 直方图均衡

figure,
subplot(2,2,1),subimage(I);
subplot(2,2,2),imhist(I);
subplot(2,2,3),subimage(J);
subplot(2,2,4),imhist(J);

figure,plot((0:255)/255,T); % 转移函数的变换曲线
%% 采用灰度变换的方法增强图像的对比度

J=imadjust(I,[0.3 0.65], [0 1]);%还是刚才的图，采用灰度变换的方法增强图像的对比度

figure,
subplot(2,2,1),subimage(I);
subplot(2,2,2),imhist(I);
subplot(2,2,3),subimage(J);
subplot(2,2,4),imhist(J);


%% 模拟图像受高斯白噪声和椒盐噪声的影响然后分别进行空域滤波
I=imread('eight.tif');
J1=imnoise(I,'gaussian',0,0.02); % 叠加均值为0，方差为0.02的高斯噪声，可以用                                    
J2=imnoise(I,'salt & pepper',0.04); % 叠加密度为0.04的椒盐噪声。
figure,
subplot(1,3,1),subimage(I);
subplot(1,3,2),subimage(J1);
subplot(1,3,3),subimage(J2);

I_Filter1=medfilt2(J2,[3 3]);  %窗口大小为3×3，中值滤波
I_Filter2=medfilt2(J2,[5 5]);  %窗口大小为5×5，
I_Filter3=medfilt2(J2,[7 7]);  %窗口大小为7×7，

figure,
subplot(1,3,1),subimage(I_Filter1);
subplot(1,3,2),subimage(I_Filter2);
subplot(1,3,3),subimage(I_Filter3);


h=[1 1 1; 1 1 1; 1 1 1];      % 3×3邻域平均滤波
                               %  用  h= fspecial('average',[3 3]); %也一样
h=h/9;
I_Filter4=filter2(h,J1);
h2= fspecial('gaussian',[3 3],0.5);
I_Filter5=filter2(h2,J1);
figure,
subplot(1,2,1),subimage(uint8(I_Filter4));
subplot(1,2,2),subimage(uint8(I_Filter5));
%% 图像的锐化
I=imread('rice.png');
h3=[1 1 1;1  -8 1; 1 1 1];% 拉普拉斯模板
I_Filter6=imfilter(I,h3);
I_Filter6=imadd(I,I_Filter6);
figure,
subplot(1,2,1),subimage(I);
subplot(1,2,2),subimage(I_Filter6);







