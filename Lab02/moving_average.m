function movav_image = moving_average(image, pixel)

    K = ones(pixel)/(pixel^2); 
    movav_image = conv2(image, K, 'same');
    figure, imagesc(K), colormap gray, title('Moving avarage filter image')
    figure, surf(K), colormap gray,  title('Moving avarage filter surface')
end