%% 2.6 Undoing Perspective Distortion of Planar Surface
%% a. Load and display the image
P_book = imread('book.jpg');
figure;
imshow(P_book);
title('Original image');
% Specify vectors x and y to indicate for corners of the desired image
[X, Y] = ginput(4);

%% Coord of the 4 corners based on A4 (210x297) in the same order as above
X_target = [0 210 210 0];
Y_target = [0 0 297 297];

%% Set up matrices required to estimate the projective transformation based on the given equation 

A = zeros(8);
v = zeros(8,1);
for i = 1: 8
    if(mod(i,2)==1)
        A(i,1)=X(idivide(i+1,int8(2)));
        A(i,2)=Y(idivide(i+1,int8(2)));
        A(i,3)=1;
        A(i,7)=-X_target(idivide(i+1,int8(2)))*X(idivide(i+1,int8(2)));
        A(i,8)=-X_target(idivide(i+1,int8(2)))*Y(idivide(i+1,int8(2)));
        v(i)= X_target(idivide(i+1,int8(2)));
    else
        A(i,4)=X(idivide(i,int8(2)));
        A(i,5)=Y(idivide(i,int8(2)));
        A(i,6)=1;
        A(i,7)=-Y_target(idivide(i,int8(2)))*X(idivide(i,int8(2)));
        A(i,8)=-Y_target(idivide(i,int8(2)))*Y(idivide(i,int8(2)));
        v(i)= Y_target(idivide(i,int8(2)));
    end
        
end
%% Computes u = A^-1 * v
u = A \ v;

%% Convert the projective transformation parameters to the normal matrix form
U = reshape([u;1], 3, 3)';
U    
%% Verify that this is correct by transforming the original coordinates
w = U*[X'; Y'; ones(1,4)];
w = w ./ (ones(3,1) * w(3,:));
w
%% Warp the image 
T = maketform('projective', U');
P2 = imtransform(P_book, T, 'XData', [0 210], 'YData', [0 297]);

%% Display the image 
figure;
imshow(P2);
title('Transformed image');

