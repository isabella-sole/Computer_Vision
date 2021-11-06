% Studying the Hue values:
function [mean, st_dev] = hue_evaluation(Img)

    car_area = Img(390:400,575:595); % Selecting dark car area
    %car_area = Img(390:400, 710:740); % Selecting red car area
    mean = mean2(car_area); % Computing the mean value
    st_dev = std2(car_area); % Computing the standard deviation
end