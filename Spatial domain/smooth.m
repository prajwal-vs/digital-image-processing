I = imread('lena_gray_256.tif');

Iblur1 = imgaussfilt(I,2);
Iblur2 = imgaussfilt(I,4);
Iblur3 = imgaussfilt(I,8);

Iblur1 = imgaussfilt(I,2);
Iblur2 = imgaussfilt(I,4);
Iblur3 = imgaussfilt(I,8);

figure
imshow(Iblur1)
title('Smoothed image, \sigma = 2')

figure
imshow(Iblur2)
title('Smoothed image, \sigma = 4')

figure
imshow(Iblur3)
title('Smoothed image, \sigma = 8')