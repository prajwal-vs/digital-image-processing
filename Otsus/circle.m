I = imread('circles.png');
level = graythresh(I)
BW = imbinarize(I,level);

imshowpair(I,BW,'montage')

imwrite(BW,'bwCircle.png')