I= imread('Saltnoise.tif');

A=gmean(I,3,3);
B=harmean(I,3,3);

C=alphatrim(I,3,3,14);
D=charmean(I,3,3,1.5);

K = imread('gnoise.tif');
subplot(2,2,1),imshow(K),title('Image with noise');

A = ones(5,5) / 25;
E = imfilter(K,A);

%median
F = medfilt2(I);    

%max
A = imread('gnoise.tif');

%PREALLOCATE THE OUTPUT MATRIX
G=zeros(size(A));

%PAD THE MATRIX A WITH ZEROS
modifyA=padarray(A,[1 1]);

        x=[1:3]';
        y=[1:3]';
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
      
       %VECTORIZED METHOD
       window=reshape(modifyA(i+x-1,j+y-1),[],1);

       %FIND THE MAXIMUM VALUE IN THE SELECTED WINDOW
        
       G(i,j)=max(window);
        H(i,j)=min(window);
    end
end

%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
G=uint8(G);
H=uint8(H);

%midpoint
J = mid(I,3,3);



subplot(3,3,1),imshow(E),title('Arthematic');
subplot(3,3,2),imshow(A),title(' Gmean');
subplot(3,3,3),imshow(B),title(' Harmean');
subplot(3,3,4),imshow(C),title('Alphatrim');
subplot(3,3,5),imshow(D),title('Charmean');
subplot(3,3,6),imshow(F),title('Median');
subplot(3,3,7),imshow(G),title('Max');
subplot(3,3,8),imshow(H),title('Min');
subplot(3,3,9),imshow(J),title('Mid');
