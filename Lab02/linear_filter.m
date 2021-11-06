function filtered_image = linear_filter(image, filter_size, filter_type)

    switch filter_type
        case 1 % Impulse filter
            center = ceil(filter_size/2);
            %build the kernel
            K = zeros(filter_size);       
            K(center, center) = 1;
        
        case 2 % Shifted left filter
            center = ceil(filter_size/2);
            K = zeros(filter_size);       
            K(center, filter_size) = 1;

        case 3 % Bluring filter
            center = ceil(filter_size/2);
            K = (ones(filter_size)/(filter_size^2));            
            
        case 4 % Sharpening filter
            center = ceil(filter_size/2);
            K = zeros(filter_size);       
            K(center, center) = 2;
            K = K - (ones(filter_size)/(filter_size^2));
            
       
        otherwise

            disp('ERROR: choose a filter type between 1 and 4')

        return
        
    end
    
    figure, imagesc(K), colormap gray, title('Linear filter image')
    figure, surf(K), colormap gray,  title('Linear filter surface')
    filtered_image = conv2 (image, K, 'same');
    
    
    
    
end