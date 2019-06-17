%low pass = blurring or smoothing
%median = remove noise from img
%high pass = make img appear sharper
%high boost = =emphasize high fre comp w/o ele low fre comp
tic
clc;
clear all;
close all;
a = imread('lena_gray_256.tif');
b = im2double(a);

[m,n] = size(b);
A = 2;
c = zeros(m,n);
d = zeros(m,n);
e = zeros(m,n);
f = zeros(m,n);
g = zeros(m,n);
h = zeros(m,n);
k = zeros(m,n);
l = zeros(m,n);
for i = 2:m-1
    for j = 2:n-1
        c(i,j) = 1/9*(b(i-1,j-1) + b(i-1,j) + b(i-1,j+1) + b(i,j-1) + b(i,j) + b(i,j+1) + b(i+1,j-1) + b(i+1,j) + b(i+1,j+1));
        d1 = b(i-1:i+1,j-1:j+1);
        d2 = reshape(d1,1,9);
        d3 = sort(d2);
        d4 = median(d3);
        d(i,j) = d4;
        e(i,j) = 1/9*(8*b(i,j) - (b(i-1,j-1) + b(i-1,j) + b(i-1,j+1) + b(i,j-1) + b(i,j+1) + b(i+1,j-1) + b(i+1,j) + b(i+1,j+1)));
        f(i,j) = b(i,j) - c(i,j);
        g(i,j) = (A - 1)*b(i,j) + f(i,j);
        Gx1 = b(i-1,j-1) - b(i,j);
        Gy1 = b(i-1,j) - b(i,j-1);
        h(i,j) = sqrt(Gx1.^2 + Gy1.^2);
        Gx2 = (b(i+1,j-1) + b(i+1,j) + b(i+1,j+1)) - (b(i-1,j-1) + b(i-1,j) + b(i-1,j+1));
        Gy2 = (b(i-1,j+1) + b(i,j+1) + b(i+1,j+1)) - (b(i-1,j-1) + b(i,j-1) + b(i+1,j-1));
        k(i,j) = sqrt(Gx2.^2 + Gy2.^2);
        Gx3 = (b(i+1,j-1) + 2*b(i+1,j) + b(i+1,j+1)) - (b(i-1,j-1) + 2*b(i-1,j) + b(i-1,j+1));
        Gy3 = (b(i-1,j+1) + 2*b(i,j+1) + b(i+1,j+1)) - (b(i-1,j-1) + 2*b(i,j-1) + b(i+1,j-1));
        l(i,j) = sqrt(Gx3.^2 + Gy3.^2);
        
        
    end
end
imshow(b);title('original image');
figure;
imshow(c);title('low pass filtered image');
figure;
imshow(d);title('Median Filtered Image');
figure;
imshow(e);title('high pass filtered image');
figure;
imshow(g);title('High Boost Image');

toc


 






        
        