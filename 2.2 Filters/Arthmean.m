K = imread('gnoise.tif');
subplot(2,2,1),imshow(K),title('Image with noise');

h = ones(5,5) / 25;
I2 = imfilter(K,h);
subplot(2,2,2),imshow(I2),title('arithmetic mean filtered image');

