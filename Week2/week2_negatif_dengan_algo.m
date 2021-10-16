f = imread('D:\ketum-profile 2.png');
f = rgb2gray(f);
[r, c] = size(f);
for x = 1 : r
    for y = 1 : c
        G (x,y) = 255 - f(x,y);
    end
end

subplot(1,2,1), imshow(f), title('Citra asli');
subplot(1,2,2), imshow(G), title('Citra negatif');