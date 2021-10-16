gambar = imread('4.jpg');
tomat = rgb2gray(gambar);
negasi = 255-tomat;
subplot(1,4,1),imshow(gambar),title('citra asli');
subplot(1,4,2),imshow(tomat),title('citra grayscale');
subplot(1,4,3),imshow(negasi),title('citra negasi');
subplot(1,4,4),imhist(negasi),title('histogram citra');