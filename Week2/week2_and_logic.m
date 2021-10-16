A = im2bw(imread('cameraman.tif'));
B = im2bw(imread('rice.png'));
C = and(A,B);

subplot (1,3,1), imshow(uint8(A)),title ('Citra 1' );
subplot (1,3,2), imshow(uint8(B)),title ('Citra 1' );
subplot (1,3,3), imshow(uint8(C)),title ('Citra And' );