I = imread('lena_gray_256.tif');
structuralElement = strel(ones(3,3));

%Smoothing
E = imerode(I,structuralElement);
D = imdilate(E,structuralElement);

E1 = imdilate(I,structuralElement);
D1 = imerode(E1,structuralElement);



%gradient
B = imdilate(I, structuralElement) - imerode(I, structuralElement);
subplot(2,2,1); imshow(I); title('Original')
subplot(2,2,2); imshow(B); title('Gradient');
subplot(2,2,3); imshow(D); title('Smoothing (Eroded and Dilated)');
subplot(2,2,4); imshow(D1); title('Smoothing (Dilated and Eroded)');