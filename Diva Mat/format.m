 img = imread('lena_gray_256.tif');
 imwrite(img, 'lena_gray.png');
 imwrite(img, 'lena_gray.jpg');
 imwrite(img, 'lena_gray.bmp');
imwrite(img, 'lena_gray.ppm');
 
[X1,map1]=imread('lena_gray.png');
[X2,map2]=imread('lena_gray.jpg');
[X3,map3]=imread('lena_gray.bmp');
subplot(1,3,1), imshow(X1,map1)
subplot(1,3,2), imshow(X2,map2)
subplot(1,3,3), imshow(X3,map3)
 
 
 
 