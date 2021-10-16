x = imread('4.jpg');
xg = rgb2gray(x);

xd=double(xg);
h=[1 1 1;1 1 1;1 1 1]/9

yd=week4_konvolusi(h,xd);
y =uint8(yd);

subplot(1,2,1), imshow(xg), title('Gambar Asli');
subplot(1,2,2), imshow(y), title('Smooth Filter');