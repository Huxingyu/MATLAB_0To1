A=imread('lena.bmp');        %显示原图
A = rgb2gray(A);
imshow(A,map),                                     
title('原图');
[h,w] = size(A);
% rimage = zeros(h,w);
% image=double(A);%求负片
% for i=1:h
%    for j=1:w
%       rimage(i,j)=255-image(i,j);
%    end
% end
rimage = 255-A;
figure,imshow(rimage,map); %显示负片
title('负片');
