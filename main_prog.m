function main_prog

theta = [0; pi/4; pi/2; 3*pi/4]; 
% 4 orientations for the Gabor
img = imread('IMG_20181105_112932.jpeg','JPG');   
% Read a jpg image of you
img_bw = rgb2gray(img);
 %Transform into black and white
for i=1:4%3a-3c
    [g1 g2] = GaborD(15, 10, 10, theta(i), 2, 0, 0); % Apply Gabor function
    figure, imagesc(g1); colormap(gray); % Show Gabor function
    conv_images = conv2(double(img_bw),g1,'same'); % 2D convolution
    figure, imagesc(conv_images); colormap(gray); % Show convolved images
end

EG=Energy_GaborD(15, 10, 10, theta(1), 2, 0, 0,img_bw);%3e
for i=2:4
    EG=EG+Energy_GaborD(15, 10, 10, theta(i), 2, 0, 0,img_bw);%combining the images togethter
end
figure, imagesc(EG); colormap(gray);   
gaussian_p=G_pyramid(img_bw,8);
for i=1:8
    figure, imagesc(gaussian_p{i}); colormap(gray);   
end
laplacian_p=L_pyramid(img_bw,10)
for j=1:10
    figure, imagesc(laplacian_p{j}); colormap(gray);
end
