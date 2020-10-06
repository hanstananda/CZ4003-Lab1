%% 2.1 Contrast Stretching
%% a. Load Image
Pc = imread('mrt-train.jpg');
whos Pc
%% Change Image to grayscale
P = rgb2gray(Pc);
whos P
%% b. Show the image 
figure
imshow(P);
title('Original Image')
%% c. Check the minimum and maximum intensities present in the image
min(P(:)), max(P(:))
%% d. two lines of MATLAB code to do contrast stretching
P2 = imsubtract(P,13);
P2 = immultiply(P2, 255/(204-13));
% check image class
whos P2
% check min and max of P2 
min(P2(:)), max(P2(:))
%% e. display stretched image
figure
imshow(P2)
title('Stretched Image')