clc; clear; close all;

I = imread('dark.tif');
figure(1); imshow(I);
[counts, centers] = hist(double(I(:)),[0:1:255]);
figure(2); bar(centers,counts);


I2 = imread('light.tif');
figure(3); imshow(I2);
[counts, centers] = hist(double(I2(:)),[0:1:255]);
figure(4); bar(centers,counts);

figure(5);
imhist(I);

figure(6);
imhist(I2);

J = histeq(I,256);
figure(7);imshow(J);
figure(8);
imhist(J);

% J2 = histeq(I2,256);
% figure(7);imshow(J2);
% figure(8);
% imhist(J2);


myJ = myHisteq(I,256);
figure(9);imshow(myJ);
figure(10);
imhist(myJ);

figure; 
subplot(1,3,1); imshow(I); title('dark image')
subplot(1,3,2); imshow(J); title('histogram equalized dark image')
subplot(1,3,3); imshow(myJ); title('my histogram equalized dark image')

figure; 
subplot(1,3,1); imhist(I); title('dark image histogram')
subplot(1,3,2); imhist(J); title('built in function histogram')
subplot(1,3,3); imhist(myJ); title('my function histogram')
