%contrast adjustment using img histogram
I = imread('lena_gray_256.tif');
J = histeq(I);
imshowpair(I,J,'montage')
axis off
