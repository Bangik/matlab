f = imread('cacat (15).jpg');
red = f(:,:,1);
green = f(:,:,2);
blue = f(:,:,3);
rgbgray = rgb2gray(f);
%imshow(f)