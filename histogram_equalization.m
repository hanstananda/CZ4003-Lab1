%% 2.2 Histogram Equalization
%% Reload Image from 2.1 
Pc = imread('mrt-train.jpg');
P = rgb2gray(Pc);
whos P
%% a. Display the image intensity histogram of P using 10 bins
figure
imhist(P,10);

% Display the image intensity histogram of P using 256 bins 
figure
imhist(P,256);

%% b. Histogram Equalization 
P3 = histeq(P,255);

% Redisplay the image intensity histogram of P using 10 bins 
figure
imhist(P3,10);

% Redisplay the image intensity histogram of P using 256 bins 
figure
imhist(P3,256);

%% c. Rerun the histogram equalization on P3
P3_1 = histeq(P3,255);

% Redisplay the image intensity histogram of P using 10 bins 
figure
imhist(P3_1,10);

% Redisplay the image intensity histogram of P using 256 bins 
figure
imhist(P3_1,256);
%%
sum(sum(P3-P3_1))