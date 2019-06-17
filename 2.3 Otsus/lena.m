I = imread('lena_gray_256.tif');
level = graythresh(I);
BW = imbinarize(I,level);
imwrite(BW,'BWLena.tif')
imshowpair(I,BW,'montage')





