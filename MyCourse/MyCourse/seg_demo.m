%% ͼ��ı�Ե���
I = imread('rice.png');
BW1 = edge(I,'prewitt',0.04);             %  0.04Ϊ�ݶ���ֵ
BW2 = edge(I,'roberts');
BW3 = edge(I,'sobel');
BW4 = edge(I,'log',0.003);  % ��=2
BW5 = edge(I,'log',0.003,3); % ��=3
BW6 = edge(I,'canny',0.2);  
figure(1);
imshow(I);
figure(2);
subplot(2,3,1),imshow(BW1);title('prewitt')
subplot(2,3,2),imshow(BW2);title('roberts')
subplot(2,3,3),imshow(BW3);title('sobel')
subplot(2,3,4),imshow(BW4);title('LoG ��=2')
subplot(2,3,5),imshow(BW5);title('LoG ��=3')
subplot(2,3,6),imshow(BW6);title('canny')
%% ͼ�����ֵ�ָ�
I = imread('coins.png');
figure(3); 
subplot(1,3,1),imshow(I); 
subplot(1,3,2),imhist(I);          % �۲�Ҷ�ֱ��ͼ�� �Ҷ�140���йȣ�ȷ����ֵT=140
 T= graythresh(I);
BW=im2bw(I,T); % im2bw������Ҫ���Ҷ�ֵת����[0,1]��Χ��
subplot(1,3,3),imshow(BW);
%% ��̬ѧʵ��������PCBͼ����ɾ�����е����ߣ�������оƬ����
I=imread('circbw.tif');
imshow(I);
SE=strel('rectangle',[40 30]);  % �ṹ����
J=imopen(I,SE);            % ��������
figure,imshow(J);
%%
originalBW = imread('circles.png');  
se = strel('disk',11);        
erodedBW = imerode(originalBW,se);
dilatedBW = imdilate(originalBW,se);
figure,
subplot(311),imshow(originalBW);title('ԭʼͼ��');
subplot(312),imshow(erodedBW);title('��ʴ���');
subplot(313),imshow(dilatedBW);title('���ͽ��');

openBW = imopen(originalBW,se);
closedBW = imclose(originalBW,se);
figure,
subplot(211),imshow(openBW);title('��������');
subplot(212),imshow(closedBW);title('��������');
