%% 图像的边缘检测
I = imread('rice.png');
BW1 = edge(I,'prewitt',0.04);             %  0.04为梯度阈值
BW2 = edge(I,'roberts');
BW3 = edge(I,'sobel');
BW4 = edge(I,'log',0.003);  % σ=2
BW5 = edge(I,'log',0.003,3); % σ=3
BW6 = edge(I,'canny',0.2);  
figure(1);
imshow(I);
figure(2);
subplot(2,3,1),imshow(BW1);title('prewitt')
subplot(2,3,2),imshow(BW2);title('roberts')
subplot(2,3,3),imshow(BW3);title('sobel')
subplot(2,3,4),imshow(BW4);title('LoG σ=2')
subplot(2,3,5),imshow(BW5);title('LoG σ=3')
subplot(2,3,6),imshow(BW6);title('canny')
%% 图像的阈值分割
I = imread('coins.png');
figure(3); 
subplot(1,3,1),imshow(I); 
subplot(1,3,2),imhist(I);          % 观察灰度直方图， 灰度140处有谷，确定阈值T=140
 T= graythresh(I);
BW=im2bw(I,T); % im2bw函数需要将灰度值转换到[0,1]范围内
subplot(1,3,3),imshow(BW);
%% 形态学实例——从PCB图像中删除所有电流线，仅保留芯片对象
I=imread('circbw.tif');
imshow(I);
SE=strel('rectangle',[40 30]);  % 结构定义
J=imopen(I,SE);            % 开启运算
figure,imshow(J);
%%
originalBW = imread('circles.png');  
se = strel('disk',11);        
erodedBW = imerode(originalBW,se);
dilatedBW = imdilate(originalBW,se);
figure,
subplot(311),imshow(originalBW);title('原始图像');
subplot(312),imshow(erodedBW);title('腐蚀结果');
subplot(313),imshow(dilatedBW);title('膨胀结果');

openBW = imopen(originalBW,se);
closedBW = imclose(originalBW,se);
figure,
subplot(211),imshow(openBW);title('开运算结果');
subplot(212),imshow(closedBW);title('闭运算结果');
