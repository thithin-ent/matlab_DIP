clc; clear; close all;

I1 = imread('image.jpg');
I1 = rgb2gray(I1);
[r,c] = size(I1);
I2 = imread('rectangle.tif');
I2 = imresize(I2,[r,c],'bicubic');

F = fft2(I1);
absF = abs(F); 
phase = angle(F);

F2 = fft2(I2);
absF2 = abs(F2); 
phase2 = angle(F2);

phase_re = cos(phase) + sin(phase)*1i;
IF = real(ifft2(phase_re));
logF = log(1+IF);

IF2 = ifft2(absF);
IF2 = real(IF2);
logF2 = log(1+IF2);

IFWP  = absF2.*cos(phase) + absF2.*sin(phase)*1i; 
re_WP = real(ifft2(IFWP));

IFWM  = absF.*cos(phase2) + absF.*sin(phase2)*1i; 
re_WM = real(ifft2(IFWM));

figure;
subplot(2,3,1); 
imshow(I1);  title('input image')
subplot(2,3,2); 
imagesc(phase); colormap gray; title('phase')
subplot(2,3,3);
imagesc(logF); colormap gray; title('phase restore')
subplot(2,3,4); 
imagesc(logF2); colormap gray; title('spectrum restore')
subplot(2,3,5); 
imagesc(re_WP); colormap gray; title('restore face phase and rectangle spectrum')
subplot(2,3,6); 
imagesc(re_WM); colormap gray; title('restore face spectrum and rectangle phase')

