I= imread('gnoise.tif');
A=gmean(I,3,3);
B=harmean(I,3,3);
C=alphatrim(I,3,3,2);

subplot(2,4,1),imshow(I),title('Original Image');
subplot(2,4,2),imshow(A),title(' Gmean');
subplot(2,4,3),imshow(B),title(' Harmean');
subplot(2,4,4),imshow(C),title('Alphatrim');