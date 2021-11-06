function gaussfil_image = gaussian_filter(image, fsize)

    sigma = fsize/6; % The half of the filter size must be three times the standard deviation 
    h = fspecial('gaussian', fsize, sigma);
    figure, imagesc(h), colormap gray, title('Gaussian filter image')
    figure, surf(h), colormap gray,  title('Gaussian filter surface')
    gaussfil_image = imfilter(image, h); % applying filter to the image
    
end