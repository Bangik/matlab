A = im2bw(imread ('3.jpg'));
B = im2bw(imread ('4.jpg'));
C = or(A,B);

subplot (1,3,1), imshow(uint8(A)),title ('Citra 1' );
subplot (1,3,2), imshow(uint8(B)),title ('Citra 1' );
subplot (1,3,3), imshow(uint8(C)),title ('Citra Or' );