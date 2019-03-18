I=imread('lena.bmp');
I = rgb2gray(I);
h1_x = [1 0;0  -1 ]; h1_y = [0 1;-1  0 ];
I_Robert_x = imfilter(I,h1_x);
I_Robert_y = imfilter(I,h1_y);
%I_Robert = sqrt(double(I_Rober_x.^2+I_Rober_y.^2));
I_Robert = abs(I_Robert_x)+abs(I_Robert_y);

h2_x = [-1 -1 -1;0  0 0; 1 1 1];
h2_y = [-1 0 1;-1 0 1; -1 0 1];
I_Prewitt_x = imfilter(I,h2_x);
I_Priwitt_y = imfilter(I,h2_y);
%I_Priwitt = sqrt(double(I_Prewitt_x.^2+I_Priwitt_y.^2));
I_Priwitt = abs(I_Prewitt_x)+abs(I_Priwitt_y);

h3_x = [-1 -2 -1;0  0 0; 1 2 1];
h3_y = [-1 0 1;-2 0 2; -1 0 1];
I_Sobel_x = imfilter(I,h3_x);
I_Sobel_y = imfilter(I,h3_y);
%I_Sobel = sqrt(double(I_Sobel_x.^2+I_Sobel_y.^2));
I_Sobel = abs(I_Sobel_x)+abs(I_Sobel_y);

figure(1),subplot(221),imshow(I);
          subplot(222),imshow(uint8(I_Robert));
          subplot(223),imshow(uint8(I_Priwitt));
          subplot(224),imshow(uint8(I_Sobel));

          
 %%
h4 = [1 1 1;1  -8 1; 1 1 1];
h5 = [0 1 0;1  -4 1; 0 1 0];
I_Laplacian4  = imfilter(I,h4);
I_Laplacian5  = imfilter(I,h5);
figure(2),
subplot(121),imshow(uint8(I_Laplacian4),[]);
subplot(122),imshow(uint8(I_Laplacian5),[]);
%%
I_Filter1=imadd(I,I_Robert);
I_Filter2=imadd(I,I_Priwitt);
I_Filter3=imadd(I,I_Sobel);
I_Filter5=imadd(I,I_Laplacian5);


figure(3),subplot(221),imshow(I_Filter1);
          subplot(222),imshow(uint8(I_Filter2));
          subplot(223),imshow(uint8(I_Filter3));
          subplot(224),imshow(uint8(I_Filter5));


