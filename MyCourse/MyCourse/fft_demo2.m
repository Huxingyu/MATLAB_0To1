clc,clear 
I=imread('grass.bmp'); 
[imh, imw] = size(I);
I_fft = fft2(I);
H3 = fspecial('gaussian'); 
H3_fft  = fft2(H3,imh, imw); 
J3_fft = H3_fft.*I_fft;
J3 = ifft2(J3_fft);

H=fspecial('sobel'); 
H_fft  = fft2(H,imh, imw); 
J_fft = H_fft.*I_fft;
J = ifft2(J_fft);

figure(1), imagesc(abs(fftshift(H3_fft)));
axis image, colormap jet
figure(2), imagesc(log(abs(fftshift(I_fft))));
axis image, colormap jet
figure(3), imagesc((abs(fftshift(J3_fft))));
axis image, colormap jet
figure(4),imshow(J3,[]);

%J2=filter2(H,I); 
%figure(5),imshow(J2,[]);
%%
hs = 50; % filter half-size
H2 = fspecial('gaussian', hs*2+1, 10); 
H2_fft  = fft2(H2, imh, imw);                    % 2) fft fil, pad to same size as image
J_fft = I_fft .* H2_fft;                           % 3) multiply fft images
J = ifft2(J_fft);                               % 4) inverse fft2

figure(1), imagesc(abs(fftshift(H2_fft)));
axis image, colormap jet
figure(2), imagesc(log(abs(fftshift(I_fft))));
axis image, colormap jet
figure(3), imagesc(log(abs(fftshift(J_fft))));
axis image, colormap jet
figure(4),imshow(J,[]);

%%
I=imread('flower.bmp'); % sea2.bmp,sea.bmp
I_fft  = fft2(I); 
figure(1), imagesc(log(abs(fftshift(I_fft))));
axis image, colormap jet
