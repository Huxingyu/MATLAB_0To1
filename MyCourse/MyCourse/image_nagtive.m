A=imread('lena.bmp');        %��ʾԭͼ
A = rgb2gray(A);
imshow(A,map),                                     
title('ԭͼ');
[h,w] = size(A);
% rimage = zeros(h,w);
% image=double(A);%��Ƭ
% for i=1:h
%    for j=1:w
%       rimage(i,j)=255-image(i,j);
%    end
% end
rimage = 255-A;
figure,imshow(rimage,map); %��ʾ��Ƭ
title('��Ƭ');
