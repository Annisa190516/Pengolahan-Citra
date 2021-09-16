tugas3 = imread('tugas1.png');
b = rgb2gray(tugas3);
figure(1)
imshow(tugas3)
figure(2)
imhist(b)
tugas3 = [1 3 4 5;1 2 1 1;3 3 4 7;2 1 1 7];


%histogram
[n m]= size(b);
H = zeros(1,256);
for x = 1 : n
for y = 1:m
ii = b(x,y);
H(ii+1) = H(ii+1) + 1;
end
end
figure(3)
bar(0:255,H);
axis([0 255 0 1600])
grid on

%Distribusi komulatif
for w = 1:256
c(w) = sum (H(1:w));
end
figure(4)
bar(0:255,c(w));
axis([0 255 0 m*n])
grid on

for k = 1 : 256
wb(k) = round(c(k)*255/(m*n));
end

%histogram equalisasi
c = b;
[n m] = size(c);

for x = 1 : n
for y = 1:m
ii = c(x,y);
c(x,y) = wb(ii+1);
end
end
figure(5)
imshow(c)
figure(6)
imhist(c);


%histogram
[n m]= size(c);
H = zeros(1,256);
for x = 1 : n
for y = 1:m
ii = c(x,y);
H(ii+1) = H(ii+1) + 1;
end
end
figure(6)
bar(0:255,H);
axis([0 255 0 1600])
grid on

%distribusi kumulatif
for w = 1:256
    D(w) = sum(H(1:w));
end
figure(7)
bar(0:255,D)
axis([0 255 0 m*n])
grid on


