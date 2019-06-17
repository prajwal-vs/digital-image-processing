originalI = imread('BWLena.tif');

se = strel('disk',5);
erodedI = imerode(originalI,se);
BW4 = imdilate(originalI,se);

afterOpening = imopen(originalI,se);
afterClose = imclose(originalI,se);


se1 = [0 1 0
       1 0 1
       0 1 0]
   se2 = [0 0 0
       0 1 0
       0 0 0]
  A=bwhitmiss(originalI,se1,se2);   


subplot(2,3,1),imshow(originalI),title('Original Image');
subplot(2,3,2),imshow(erodedI),title('Erosion');

subplot(2,3,3),imshow(BW4),title('Dialation');
subplot(2,3,4),imshow(afterOpening),title('Open');
subplot(2,3,5),imshow(afterClose),title('Close');
subplot(2,3,6),imshow(A),title('Hit-Miss');
