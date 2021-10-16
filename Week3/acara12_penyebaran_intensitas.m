gambar = imread('3.jpg');
bakteri = rgb2gray(gambar);
HQ=histeq(bakteri);
subplot(1,3,1),imshow(gambar),title('citra asli');
subplot(1,3,2),imshow(bakteri),title('citra grayscale');
subplot(1,3,3),imshow(HQ),title('Hist. Equalization');