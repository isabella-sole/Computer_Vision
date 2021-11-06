% Segmenting the object in the image by thresholding the Hue component:
function [first_mask, seg] = segmentation(Img, mean, st_dev, numFrame)
    
    [r, c] = size(Img);
    first_mask = zeros(r, c); % Initialization of the mask
    threshold_min = mean - st_dev; %threshold_min dark car
    threshold_max = mean + 2* st_dev; %threshold_max dark car
    %threshold_min = mean - 0.2 * st_dev; %threshold_min red car
    %threshold_max = mean + 2 * st_dev; %threshold_max red car
    mask = Img > threshold_min & Img < threshold_max; % Thresholding the Hue component
    first_mask = first_mask + mask;
    figure, imagesc(first_mask), colormap gray, title(['First result of the segmentation for frame ', num2str(numFrame)])
    
    K = ones(9)/9^2; % Creation of an average filter
    filtred_mask = conv2(first_mask, K); % Filtering the mask
    figure, imagesc(filtred_mask), colormap gray, title(['Result of the segmentation after the convolution with the filter for frame ', num2str(numFrame)])
    
    seg = filtred_mask > threshold_min & filtred_mask < threshold_max; % Thresholding the filtered mask
end