I1 = imread('einstein.bmp');
I1 = imrotate(I1,6,'bilinear','crop');
I2 = imread('marilyn22.bmp');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
I1_ = fftshift(fft2(double(I1)));
I2_ = fftshift(fft2(double(I2)));
figure,imshow(log(abs(I1_)),[-1,5]);
%%
