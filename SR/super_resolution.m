clc; clear; close all;
file = ["small/[크기변환]baby.png","small/[크기변환]bird.png","small/[크기변환]butterfly.png","small/[크기변환]head.png","small/[크기변환]woman.png"];
file2 = ["원본/baby.png","원본/bird.png","원본/butterfly.png","원본/head.png","원본/woman.png"];
file3 = ["deep/baby_x4_SR.png","deep/bird_x4_SR.png","deep/butterfly_x4_SR.png","deep/head_x4_SR.png","deep/woman_x4_SR.png"];

for i = 1:5
I = imread(file(i));
I_real = imread(file2(i));
I_depp = imread(file3(i));
Inn = myResizeNN(I,4);
Ibil = myResizeBil(I,4);
Ibic = myResizeBicu(I,4);
Inn2 = imresize(I,4,'nearest');
Ibil2 = imresize(I,4,'bilinear');
Ibic2 = imresize(I,4,'bicubic');
InnP(i) = psnr(Inn,I_real);
IbilP(i) = psnr(Ibil,I_real);
IbicP(i) = psnr(Ibic,I_real);
IdeepP(i) = psnr(I_depp,I_real);
Inn2P(i) = psnr(Inn2,I_real);
Ibil2P(i) = psnr(Ibil2,I_real);
Ibic2P(i) = psnr(Ibic2,I_real);
fprintf("%d 번째 ---------------------------------------------\n",i);
fprintf("NN      : my funtion : %f, built in: %f \n",InnP(i),Inn2P(i));
fprintf("bilinear: my funtion : %f, built in: %f \n",IbilP(i),Ibil2P(i));
fprintf("bicubic : my funtion : %f, built in: %f \n",IbicP(i),Ibic2P(i));
fprintf("딥러닝 : EDSR : %f \n",IdeepP(i));
figure(1)
subplot(1,5,i); imshow(Inn); title("NN")
figure(2)
subplot(1,5,i); imshow(Ibil); title("bilinear")
figure(3)
subplot(1,5,i); imshow(Ibic); title("bicubic")
figure(4)
subplot(1,5,i); imshow(I_depp); title("EDSR")
end

fprintf("평균 ---------------------------------------------\n");
fprintf("NN      : my funtion : %f, built in: %f \n",sum(InnP)/5,sum(Inn2P)/5);
fprintf("bilinear: my funtion : %f, built in: %f \n",sum(IbilP)/5,sum(Ibil2P)/5);
fprintf("bicubic : my funtion : %f, built in: %f \n",sum(IbicP)/5,sum(Ibic2P)/5);
fprintf("딥러닝 : EDSR : %f \n",sum(IdeepP)/5);



