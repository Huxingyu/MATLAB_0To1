%% FFT
% 方块信号的fft
I=zeros(128,128);
I(61:68,61:68)=1;
imshow(I);
B1=fftshift(fft2(I));% 一般在计算图3-1的图形函数的傅立叶变换时，坐标原点在
                      % 函数图形的中心位置处，而计算机在对图像执行傅立叶变换
                      % 时是以图像的左上角为坐标原点。所以使用函数fftshift进 
                      %行修正，使变换后的直流分量位于图形的中心；
figure,imshow((abs(B1)),[ ]);
axis image, colormap jet
I2=imrotate(I,45,'bilinear','crop');
B2=fftshift(fft2(I2));
figure,imshow(log(abs(B2)),[-1,5]);
I3=I;
I3(57:72,57:72)=1;
B3=fftshift(fft2(I3));
figure,imshow(log(abs(B3)),[-1,5]);
I4=zeros(128,128);
I4(11:18,11:18)=1;
B4=fftshift(fft2(I4));
figure,imshow(log(abs(B4)),[-1,5]);
%%
%普通图像的fft与低通滤波
RGB=imread('autumn.tif');	
I=rgb2gray(RGB);
imshow(I);                    
A=fft2(I);	            
A=fftshift(A);		 
figure, imshow(log(abs(A)+1),[0 10]);
A(1:80,:)=0;
A(126:206,:)=0;
A(:,1:120)=0;
A(:,245:345)=0;
I2=abs(ifft2(A))/255;
figure,imshow(I2);
J=dct2(I);	            		 
figure, imshow(log(abs(J)+1),[ ]);
J(abs(J)<10)=0;
K=idct2(J)/255;
figure, imshow(K);