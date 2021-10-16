gambar = imread('1.jpg');
blue =gambar(:,:,3);
[A, R] = size(blue);
Seg = zeros(A,R);
%dimulai perulangan sebanyak ukuran matrix A,R
for k = 1 : A
    for l = 1 : R
        if blue(k,l) < 160
            Seg(k,l)=1;
        else
            Seg(k,l)=0;
        end
    end
end

AA=bwlabeln(Seg,8);%pelabelan menggunakan 8 ketetanggaan
a=max(max(AA));%jumlah label
S=regionprops(AA,'Area');%ROI berdasarkan area
I_seg=ismember(AA, find([S.Area]>=100));

%----------------------------------------------------------------
% Mendapatkan Fitur Morfologi
%----------------------------------------------------------------
for c=1:a
    area=0;
    perimeter=0;
    for i=1:151
        for j=1:151
            if AA(i,j)==c
                area=area+1;
            end
        end
    end
    for i=2:150
        for j=2:150
            if AA(i,j)==c
                if AA(i,j)~=AA(i-1,j) || AA(i,j)~=AA(i+1,j) || AA(i,j)~=AA(i,j-1)|| AA(i,j)~=AA(i,j+1)perimeter=perimeter+1;
                end
            end
        end
    end
    luas(c)=area;
    keliling(c)=perimeter;
end

hitung=0;
for c=1:a
    if luas(c)>=100
        hitung=hitung+1;
        luas_area(hitung)=luas(c);
        keliling_area(hitung)=keliling(c);
    end
end

jum_luas=0;
jum_keliling=0;

for i=1:hitung
    jum_luas=jum_luas + luas_area(i);
    jum_keliling=jum_keliling + keliling_area(i);
end

phi=3.14;
area_mangga=jum_luas;
perimeter_mangga=jum_keliling;
bentuk_mangga=perimeter_mangga^2/area_mangga;
circularity=4*phi*area_mangga/perimeter_mangga^2;

% ---------------------------------------------------------------
% Mematrikskan Fitur dan menyimpan di excel
% ---------------------------------------------------------------
fitur=[area_mangga perimeter_mangga bentuk_mangga circularity];
xlswrite('fiturbentuk.xls',fitur); 

AA=bwlabeln(Seg,8);%pelabelan menggunakan 8 ketetanggaan
a=max(max(AA));%jumlah label
S=regionprops(AA,'Area','Perimeter');%ROI berdasarkan area dan perimeter
area_mangga=S.Area;
perimeter_mangga=S.Perimeter;
phi=3.14;
bentuk_mangga=perimeter_mangga^2/area_mangga;
circularity=4*phi*area_mangga/perimeter_mangga^2;
% ---------------------------------------------------------------
% Mematrikskan Fitur dan menyimpan di excel
% ---------------------------------------------------------------
fitur=[area_mangga perimeter_mangga bentuk_mangga circularity];
xlswrite('fiturbentuk2.xls',fitur);