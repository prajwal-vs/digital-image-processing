clear all;
clc;
close all;

OriImg=imread('lena_gray_256.tif'); 

NegImg=imcomplement(OriImg); 




subplot(1,2,1);imshow(OriImg);title('Original image');
subplot(1,2,2);imshow(NegImg);title('Negative image');