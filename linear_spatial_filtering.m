%% 2.3 Linear Spatial Filtering
%% a. Generate filters
% Source: https://www.mathworks.com/matlabcentral/answers/430031-how-to-i-apply-gaussian-filter-on-images-in-matlab
% First filter 
filter_h1 = fspecial('gaussian', [5 5], 1);
% Display first filter as 3D graphs using mesh function
figure;
mesh(filter_h1);
title('Filter h with \sigma = 1');
% Second filter
filter_h2 = fspecial('gaussian', [5 5], 2);
% Display second filter as 3D graphs using mesh function
figure;
mesh(filter_h2);
title('Filter h with \sigma = 2');

%% b. Load and display the image with gaussian noise
P_ntu_gn = imread('ntu-gn.jpg');
figure;
imshow(P_ntu_gn);
title('Original image with gaussian noise');
%% c. Filter the image using the conv2 function, and display the resultant images
%% Filter and display image after first filter is applied to the image
P_ntu_gn_after_filter_h1 = conv2(P_ntu_gn,filter_h1);
figure;
imshow(uint8(P_ntu_gn_after_filter_h1));
title('Image after filter h with \sigma = 1');
figure;
% Based on https://www.mathworks.com/matlabcentral/answers/161457-how-can-i-display-two-images-at-once
imshowpair(P_ntu_gn, uint8(P_ntu_gn_after_filter_h1), 'montage')
title('Comparison of Image before and after filter h with \sigma = 1');
%% Filter and display image after second filter is applied to the image
P_ntu_gn_after_filter_h2 = conv2(P_ntu_gn,filter_h2);
figure;
imshow(uint8(P_ntu_gn_after_filter_h2));
title('Image after filter h with \sigma = 2');
figure;
imshowpair(P_ntu_gn, uint8(P_ntu_gn_after_filter_h1), 'montage')
title('Comparison of Image before and after filter h with \sigma = 2');
%% d. Load and display the image with speckle noise
P_ntu_sp = imread('ntu-sp.jpg');
figure;
imshow(P_ntu_sp);
title('Original image with speckle noise');

%% e. Repeat step (c) to the image with speckle noise
%% Filter and display image after first filter is applied to the image
P_ntu_sp_after_filter_h1 = conv2(P_ntu_sp,filter_h1);
figure;
imshow(uint8(P_ntu_sp_after_filter_h1));
title('Image after filter h with \sigma = 1');
figure;
imshowpair(P_ntu_sp, uint8(P_ntu_sp_after_filter_h1), 'montage')
title('Comparison of Image before and after filter h with \sigma = 1');
%% Filter and display image after second filter is applied to the image
P_ntu_sp_after_filter_h2 = conv2(P_ntu_sp,filter_h2);
figure;
imshow(uint8(P_ntu_sp_after_filter_h2));
title('Image after filter h with \sigma = 2');
figure;
imshowpair(P_ntu_sp, uint8(P_ntu_sp_after_filter_h2), 'montage')
title('Comparison of Image before and after filter h with \sigma = 2');
