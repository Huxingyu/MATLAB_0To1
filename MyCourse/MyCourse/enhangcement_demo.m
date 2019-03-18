%% ֱ��ͼ���Ȼ�
I=imread('pout.tif');  % ��ȡMATLAB�Դ���potu.tifͼ��
[J,T]=histeq(I);      % ֱ��ͼ����

figure,
subplot(2,2,1),subimage(I);
subplot(2,2,2),imhist(I);
subplot(2,2,3),subimage(J);
subplot(2,2,4),imhist(J);

figure,plot((0:255)/255,T); % ת�ƺ����ı任����
%% ���ûҶȱ任�ķ�����ǿͼ��ĶԱȶ�

J=imadjust(I,[0.3 0.65], [0 1]);%���Ǹղŵ�ͼ�����ûҶȱ任�ķ�����ǿͼ��ĶԱȶ�

figure,
subplot(2,2,1),subimage(I);
subplot(2,2,2),imhist(I);
subplot(2,2,3),subimage(J);
subplot(2,2,4),imhist(J);


%% ģ��ͼ���ܸ�˹�������ͽ���������Ӱ��Ȼ��ֱ���п����˲�
I=imread('eight.tif');
J1=imnoise(I,'gaussian',0,0.02); % ���Ӿ�ֵΪ0������Ϊ0.02�ĸ�˹������������                                    
J2=imnoise(I,'salt & pepper',0.04); % �����ܶ�Ϊ0.04�Ľ���������
figure,
subplot(1,3,1),subimage(I);
subplot(1,3,2),subimage(J1);
subplot(1,3,3),subimage(J2);

I_Filter1=medfilt2(J2,[3 3]);  %���ڴ�СΪ3��3����ֵ�˲�
I_Filter2=medfilt2(J2,[5 5]);  %���ڴ�СΪ5��5��
I_Filter3=medfilt2(J2,[7 7]);  %���ڴ�СΪ7��7��

figure,
subplot(1,3,1),subimage(I_Filter1);
subplot(1,3,2),subimage(I_Filter2);
subplot(1,3,3),subimage(I_Filter3);


h=[1 1 1; 1 1 1; 1 1 1];      % 3��3����ƽ���˲�
                               %  ��  h= fspecial('average',[3 3]); %Ҳһ��
h=h/9;
I_Filter4=filter2(h,J1);
h2= fspecial('gaussian',[3 3],0.5);
I_Filter5=filter2(h2,J1);
figure,
subplot(1,2,1),subimage(uint8(I_Filter4));
subplot(1,2,2),subimage(uint8(I_Filter5));
%% ͼ�����
I=imread('rice.png');
h3=[1 1 1;1  -8 1; 1 1 1];% ������˹ģ��
I_Filter6=imfilter(I,h3);
I_Filter6=imadd(I,I_Filter6);
figure,
subplot(1,2,1),subimage(I);
subplot(1,2,2),subimage(I_Filter6);







