% Boundary extraction
A=imread('circles.png');
A = im2bw(A);
s=strel('disk',2,0);
F=imerode(A,s);
figure,
subplot(1,2,1);
imshow(A);title('Binary Image');
subplot(1,2,2);
imshow(A-F);title('Boundary extracted Image');


% RegionFilling
B = imfill(A,'holes');
figure,
subplot(1,2,1);
imshow(A);title('Binary Image');
subplot(1,2,2); imshow(B); title('Filled Image');

% Thinning & Thickening

C =bwmorph(A,'thin');
D = bwmorph(A,'thicken');
figure,
subplot(1,2,1); imshow(C);title('Thinning');
subplot(1,2,2); imshow(D);title('Thickeing');