f = imread('D:\ketum-profile 2.png');
f = rgb2gray(f);
j = clipping(f);
subplot(1,2,1), imshow(f), title('Citra asli');
subplot(1,2,2), imshow(j), title('Citra Clipping');