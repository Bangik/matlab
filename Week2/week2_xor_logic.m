A = imbinarize(rgb2gray(imread('3.jpg')));
B = imbinarize(rgb2gray(imread('4.jpg')));
C = xor(A,B);

%imshowpair(A,C, 'montage')

subplot (1,3,1), imshow(A),title ('Citra 1' );
subplot (1,3,2), imshow(B),title ('Citra 2' );
subplot (1,3,3), imshow(C),title ('Citra XOR' );