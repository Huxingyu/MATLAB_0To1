function draw2(h,name)
figure; 
surf(h);title(strcat('Ƶ��',name));
fx=abs(ifft2(h));
fx=fftshift(fx);
figure;surf(fx);title(strcat('����',name));
figure, imagesc(fx);
axis image, colormap jet
end