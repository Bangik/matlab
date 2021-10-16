f = imread('3.jpg');
rgbgray = rgb2gray(f);
subplot(1,2,1), imshow(f), title('Citra Asli');
subplot(1,2,2), imshow(rgbgray), title('Citra Gray');