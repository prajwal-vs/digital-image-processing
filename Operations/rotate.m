A=imread('lena_gray_256.tif');

J = imrotate(A,90,'bilinear');
figure,imshow(J);