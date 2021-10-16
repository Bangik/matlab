% untuk membaca citra
gambar = imread('3.jpg'); %lokasi citra
sirih = rgb2gray(gambar); %konversi warna dari RGB ke grayscale
% menampilkan hasil konversi warna grayscale
subplot(1,2,1),imshow(sirih),title('citra grayscale');
%imhist digunakan untuk menampilkan histogram
subplot(1,2,2),imhist (sirih),title('histogram citra');