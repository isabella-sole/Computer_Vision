% Splitting the images in the three RGB channels and in the three HSV channels and saving the Hue component:
function Hue = dividing_channels(Img, numFrame)

    Img_hsv = rgb2hsv(Img);
    
    figure,
    subplot(2, 3, 1)
    imagesc(Img(:, :, 1)), colormap gray, title('R component') % Red
    subplot(2, 3, 2)
    imagesc(Img(:, :, 2)), colormap gray, title('G component') % Green
    subplot(2, 3, 3)
    imagesc(Img(:, :, 3)), colormap gray, title('B component') % Blue
    subplot(2, 3, 4)
    imagesc(Img_hsv(:, :, 1)), colormap gray, title('H component') % Hue
    subplot(2, 3, 5)
    imagesc(Img_hsv(:, :, 1)), colormap gray, title('S component') % Saturation
    subplot(2, 3, 6)
    imagesc(Img_hsv(:, :, 1)), colormap gray, title('V component') % Intensity
    sgtitle(['Frame ', num2str(numFrame), ': channels splitted'])
    
    Hue = Img_hsv(:, :, 1);
end