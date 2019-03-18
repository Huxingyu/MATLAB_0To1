%%
I1=imread('greens.jpg');
I2=imread('cell.tif');
[I3,map]=imread('kids.tif');
figure,imshow(I1);
figure,imshow(I2);
figure,imshow(I3,map);
G1=rgb2gray(I1);
G3=ind2gray(I3,map);
figure;
subplot(1,2,1),subimage(G1);
subplot(1,2,2),subimage(G3);
BW=im2bw(X,map,0.5);
BW1=im2bw(I1,0.5);
BW2=im2bw(I2,0.5);
BW3=im2bw(I3,map,0.5);
figure;
subplot(1,3,1),subimage(BW1);
subplot(1,3,2),subimage(BW2);
subplot(1,3,3),subimage(BW3);

BW11=imresize(BW1,0.5);
figure,imshow(BW11);

imwrite(BW1,'A.tif');%保存成图像文件
%% 彩色图像，分通道显示
I=imread('peppers.png');
figure;
subplot(2,2,1),subimage(I(:,:,1));
subplot(2,2,2),subimage(I(:,:,2));
subplot(2,2,3),subimage(I(:,:,3));
subplot(2,2,4),subimage(I);

%颜色空间转换
I2 = rgb2hsv(I);
subplot(2,2,1),subimage(I2(:,:,1));
subplot(2,2,2),subimage(I2(:,:,2));
subplot(2,2,3),subimage(I2(:,:,3));