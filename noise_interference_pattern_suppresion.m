%% 2.5 Noise Interference Pattern Suppresion
%% a. Load and display the image 
P_pck = imread('pck-int.jpg');
figure;
imshow(P_pck);
title('Original image with interference pattern');

%% b. Fourier transform F of the image

F = fft2(P_pck);

% compute the power spectrum S
S = abs(F);
figure
imagesc(fftshift(S.^0.1));
colormap('default');

%% c. Redisplay the power spectrum without fftshift and measure actual location of the peaks
figure
imagesc(S.^0.1);
colormap('default');

% Locate coordinate (x,y) using ginput() function
% https://www.mathworks.com/help/matlab/ref/ginput.html
[x,y] = ginput(2);
%% D. Set the 5x5 neighbourhood elements at the corresponding peaks to zero in the Fourier transform F.
xr = round(x);
yr = round(y);
F_1 = F;
% https://www.mathworks.com/matlabcentral/answers/470450-how-can-i-change-a-particular-range-of-data
for i = 1: length(x)
    F_1(yr(i)-2:yr(i)+2, xr(i)-2:xr(i)+2) =0;
end
% Recompute the power spectrum 
S_1= abs(F_1);
% Display it as in step (b)
figure
imagesc(fftshift(S_1.^0.1))
colormap('default')
%% E. Compute the inverse FT and display the resultant image. 
P_pck_1 = uint8(ifft2(F_1));
figure
imshow(real(P_pck_1));
title('Image after peaks removal');
figure;
imshowpair(P_pck, real(P_pck_1), 'montage')
title('Comparison of Image before and after peak removal');
%% Improvement 
F_2 = F_1;
for i = 1: length(x)
    F_2(max(1,yr(i)-50):min(yr(i)+50,256), xr(i)) =0;
    F_2(yr(i), max(1,xr(i)-50):min(xr(i)+50,256)) =0;
end
% Recompute the power spectrum 
S_2= abs(F_2);
% Display it as in step (b)
figure
imagesc(fftshift(S_2.^0.1))
colormap('default')
title('power spectrum after improvement')
%% Compute the inverse FT and display the resultant image. 
P_pck_2 = uint8(ifft2(F_2));
figure
imshow(real(P_pck_2));
title('Image after further improvment');
figure;
imshowpair(real(P_pck_1), real(P_pck_2), 'montage')
title('Comparison of Image before and improvement');

%% F. Free the “primate” by filtering out the fence 
%% Load &display the Image
P_primate=imread('primate-caged.jpg');
P_primate = rgb2gray(P_primate);
figure
imshow(P_primate);
%% Display the power spectrum without fftshift and measure actual location of the peaks
F_primate = fft2(P_primate);
S_primate = abs(F_primate);
figure
imagesc(S_primate.^0.1);
colormap('default');
[xp, yp] = ginput;
%% Set the 5x5 neighbourhood elements at the corresponding peaks to zero in the Fourier transform F.
xpr = round(xp);
ypr = round(yp);
F_primate_1 = F_primate;
for i = 1: length(xp)
    F_primate_1(max(1,ypr(i)-2):min(ypr(i)+2, 256),max(1,xpr(i)-2):min(xpr(i)+2, 256))  =0;
end
% Recompute the power spectrum 
S_primate_1= abs(F_primate_1);
% Display it as in step (b)
figure
imagesc(fftshift(S_primate_1.^0.1))
colormap('default')
title('power spectrum after peak removal')
%% Compute the inverse FT and display the resultant image. 
P_primate_1 = uint8(ifft2(F_primate_1));
figure
imshow(real(P_primate_1));
title('Image after peak removal');

figure
imshowpair(P_primate, real(P_primate_1), 'montage')
title('Comparison of Image before and after peak removal');

%% Print coordinates

fprintf('Peaks:');
for i = 1: length(xpr)
    fprintf('(%d, %d) ', xpr(i), ypr(i));
end
fprintf('\n');

%% Improvement test (It seems to have little to no effect to the resulting image)
F_primate_2 = F_primate_1;
for i = [1,3,4]
    % F_primate_2(max(1,ypr(i)-50):min(ypr(i)+50,256), xpr(i)) =0;
    F_primate_2(:, xpr(i)) =0;
    % F_primate_2(yr(i), max(1,xr(i)-50):min(xr(i)+50,256)) =0;
end
% Recompute the power spectrum 
S_primate_2= abs(F_primate_2);
% Display it as in step (b)
figure
imagesc(fftshift(S_primate_2.^0.1))
colormap('default')
title('power spectrum after further removal')
%% Compute the inverse FT and display the resultant image. 
P_primate_2 = uint8(ifft2(F_primate_2));
figure
imshow(real(P_primate_2));
title('Image after further removal');

figure
imshowpair(real(P_primate_1), real(P_primate_2), 'montage')
title('Comparison of Image before and after further removal');
