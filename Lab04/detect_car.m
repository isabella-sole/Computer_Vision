% Detection the object:
function detect_car(Img, seg, numFrame)

    properties = regionprops(seg, 'Area','Centroid','BoundingBox');
    
    imagesc(Img), colormap gray, title(['Frame ', num2str(numFrame)])
    hold on
    
    for i = 1:length(properties)
      if properties(i).Area > 200 % Dark car: discard too small areas
      %if properties(i).Area > 300 % Red car: discard too small areas     
            x_centroid = floor(properties(i).Centroid(1));
            y_centroid = floor(properties(i).Centroid(2));
            ul_corner_width = properties(i).BoundingBox;
            plot(x_centroid, y_centroid, '*r') % Drowing a red * in the position of the centroid
            hold on
            rectangle('Position', ul_corner_width, 'EdgeColor', 'r', 'LineWidth', 2) % Drowing a red rectangle
        end
    end
end