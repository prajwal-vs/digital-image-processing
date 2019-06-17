I = imread('lena_gray_256.tif');

J = imnoise(I,'gaussian');
imwrite(J,'gnoise.tif')

K = imnoise(I,'salt & pepper');
imwrite(K,'Saltnoise.tif')

L = imnoise(I,'poisson');
imwrite(L,'posnoise.tif')

subplot(2,2,1),imshow(I),title('Original Image');
subplot(2,2,2),imshow(J),title(' Gaussian');
subplot(2,2,3),imshow(K),title(' Salt & Pepper');
subplot(2,2,4),imshow(L),title('Poisson');

