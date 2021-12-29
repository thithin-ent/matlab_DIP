clc; clear; close all;
I = imread('image.jpg');
figure(1); imshow(I);
R = I(:,:,1);
figure(2); imshow(R);
G = I(:,:,2);
figure(3); imshow(G);
B = I(:,:,3);
figure(4); imshow(B);
%%

R3 = uint8(zeros(size(I)));
R3(:,:,1)=R;
figure(5); imshow(R3);
G3 = uint8(zeros(size(I)));
G3(:,:,2)=G;
figure(6); imshow(G3);
B3 = uint8(zeros(size(I)));
B3(:,:,3)=B;
figure(7); imshow(B3);

%%
hsi = rgb2hsv(I);
H=hsi(:,:,1);
S=hsi(:,:,2);
I=hsi(:,:,3);
figure; 
subplot(2,3,4); imshow(H); axis image; colormap HSV;
subplot(2,3,5); imshow(S); axis image;
subplot(2,3,6); imshow(I); axis image;

%%

I = imread('bone.bmp');
I=rgb2gray(I);
figure; imshow(I); colormap bone; colorbar


