%% 2.4 Median Filtering
%% a. Load and display the image with gaussian noise
P_ntu_gn = imread('ntu-gn.jpg');
figure;
imshow(P_ntu_gn);
title('Original image with gaussian noise');
%% b. Filter the image using the conv2 function, and display the resultant images
%% Filter and display image after first filter is applied to the image
P_ntu_gn_after_med3 = medfilt2(P_ntu_gn, [3 3]);
figure;
imshow(uint8(P_ntu_gn_after_med3));
title('Image after median filter 3x3');
figure;
imshowpair(P_ntu_gn, uint8(P_ntu_gn_after_med3), 'montage')
title('Comparison of Image before and after median filter 3x3');
%% Filter and display image after second filter is applied to the image
P_ntu_gn_after_med5 = medfilt2(P_ntu_gn, [5 5]);
figure;
imshow(uint8(P_ntu_gn_after_med5));
title('Image after median filter 5x5');
figure;
imshowpair(P_ntu_gn, uint8(P_ntu_gn_after_med5), 'montage')
title('Comparison of Image before and after median filter 5x5');
%% c. Load and display the image with speckle noise
P_ntu_sp = imread('ntu-sp.jpg');
figure;
imshow(P_ntu_sp);
title('Original image with speckle noise');
%% d. Repeat step (b) in the image with speckle noise
%% Filter and display image after first filter is applied to the image
P_ntu_sp_after_med3 = medfilt2(P_ntu_sp, [3 3]);
figure;
imshow(uint8(P_ntu_sp_after_med3));
title('Image after median filter 3x3');
figure;
imshowpair(P_ntu_sp, uint8(P_ntu_sp_after_med3), 'montage')
title('Comparison of Image before and after median filter 3x3');
%% Filter and display image after second filter is applied to the image
P_ntu_sp_after_med5 = medfilt2(P_ntu_sp, [5 5]);
figure;
imshow(uint8(P_ntu_sp_after_med5));
title('Image after median filter 5x5');
figure;
imshowpair(P_ntu_sp, uint8(P_ntu_sp_after_med5), 'montage')
title('Comparison of Image before and after median filter 5x5');
%% Comparison of median filters 
figure;
imshowpair(uint8(P_ntu_sp_after_med3), uint8(P_ntu_sp_after_med5), 'montage')
title('Comparison of Image using median filter 3x3 vs 5x5');
