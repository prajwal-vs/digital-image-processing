I = imread('lena_gray_256.tif');
J = imtranslate(I,[45.3, -20.1],'FillValues',255);
figure
imshow(I);
title('Original Image');
set(gca,'Visible','on');
figure
imshow(J);
title('Translated Image');
set(gca,'Visible','on');