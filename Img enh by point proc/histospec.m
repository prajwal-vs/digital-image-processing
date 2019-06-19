%transform of img so that it matches specified hist
clc; 
clear all;
colormap('gray');

img=imread('lena_gray_256.tif');
figure(1);
imshow(img);
img=double(img);
hist1=zeros(1,256);
[m n]=size(img);
for i=1:m
      for j=1:n
      hist1(img(i,j)+1)=hist1(img(i,j)+1)+1;
      end
end
PDF=hist1/(m*n);
CDF(1)=PDF(1);
for k=2:256
    CDF(k)=CDF(k-1)+PDF(k);
end
L=256;
x1=imread('lena_gray_256.tif');
figure(2)
imshow(x1);
x0=double(x1); %input image
[m,n]=size(x0);
len=m*n; %number of pixels
x=reshape(x0,len,1); %convert to [len:1]
xpdf=hist(x,[0:L-1]); % pdf, 1 x L
xpdf=xpdf/len;%Normalize it to get nk/n (eq 3.3-7)....(lenis equal to sum(xpdf), number %of pixels...)
sk=xpdf*triu(ones(L));%CDF (eq 3.3-8), (eq 3.3-13)
zk=CDF;
mapping=zeros(256);
z0=zeros(m,n);
for q=1:L
for p=mapping(q)+1:L
if (zk(p)>=sk(q))
mapping(q) = p;
list=find(x0 == q-1); a=size(list);%find value
%in input image
z0(list)=p; %map sk value for each k valued
%pixel
break;
end
end
end
z0=uint8(z0);
figure(3)
imshow(z0);

