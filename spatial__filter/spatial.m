clc; close; close all;

I = imread('image.jpg');
I = rgb2gray(I);



K = ones(5,5)/5^2;
Ir = imfilter(I,K,'same');
myIr = myimfilter(I,K);
figure(1);
subplot(1,2,1);
imshow(Ir); title("imfilter image, K = 5")
subplot(1,2,2);
imshow(myIr); title("myimfilter image, K = 5")

K = ones(20,20)/20^2;
Ir = imfilter(I,K,'same');
myIr = myimfilter(I,K);
figure(3);
subplot(1,2,1);
imshow(Ir); title("imfilter image, K = 20")
subplot(1,2,2);
imshow(myIr); title("myimfilter image, K = 20")

K = ones(100,100)/100^2;
Ir = imfilter(I,K,'same');
myIr = myimfilter(I,K);
figure(4);
subplot(1,2,1);
imshow(Ir); title("imfilter image, K = 100")
subplot(1,2,2);
imshow(myIr); title("myimfilter image, K = 100")

W = ones(5,5)/5^2;
Inoise = imnoise(I,'salt & pepper');
Irnoise = imfilter(Inoise,W,'same');
Imenoise = medfilt2(Inoise);

figure(2);
subplot(1,3,1);
imshow(Inoise); title("noise image");
subplot(1,3,2);
imshow(Irnoise); title("imfilter image");
subplot(1,3,3);
imshow(Imenoise); title("median filter image");



