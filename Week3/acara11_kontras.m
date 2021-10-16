gambar = imread('3.jpg');
daun = rgb2gray(gambar);
cerah = daun + 50;
gelap = daun - 50;
subplot(1,4,1),imshow(gambar),title('citra asli');
subplot(1,4,2),imshow(daun),title('citra grayscale');
subplot(1,4,3),imshow(cerah),title('citra brightness');
subplot(1,4,4),imshow(gelap),title('citra darkness');
