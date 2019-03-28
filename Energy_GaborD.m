function [EG]= Energy_GaborD(n, sigma_y, sigma_x, theta, pr, x0, y0, img_bw)

    [g1 g2] = GaborD(n, sigma_y, sigma_x, theta, pr, x0, y0); % Apply Gabor function
    conv_images_even = conv2(double(img_bw),g1,'same');   % 2D convolution
    conv_images_even_sq= conv_images_even.^2;%taking the square of the even part
    
    [g1 g2] = GaborD(n, sigma_y, sigma_x, theta, pr, x0, y0); % Apply Gabor function
    conv_images_odd = conv2(double(img_bw),g2,'same');% 2D convolution
    conv_images_odd_sq= conv_images_odd.^2;%taking the square of the odd part

    conv_images_both=conv_images_odd_sq+conv_images_even_sq;%adding together and returning the sqaure root
    EG=conv_images_both.^0.5;

end