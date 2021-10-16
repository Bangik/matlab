gambar = imread('lombok.png');
red = mean(mean(gambar(:,:,1)));
green = mean(mean(gambar(:,:,2)));
blue = mean(mean(gambar(:,:,3)));
fitur = [red green blue]; % mematrikkan fitur
xlswrite('fiturwarna.xls',fitur); % menyimpan fitur ke file excel