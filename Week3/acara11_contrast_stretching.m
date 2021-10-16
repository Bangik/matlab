gambar = imread('3.jpg');
daun = rgb2gray(gambar);
contrast = imadjust(daun);
subplot(1,3,1),imshow(gambar),title('citra asli');
subplot(1,3,2),imshow(daun),title('citra grayscale');
subplot(1,3,3),imshow(cerah),title('citra contrast stretching');