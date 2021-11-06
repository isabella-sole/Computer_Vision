%% Computer Vision Lab 5
% NCC-based segmentation & Harris corner detection 
% Isabella-Sole Bisio S4113265

addpath('functions');
clear all
close all
clc

%% NCC-based segmentation
% Loading images:
rgb_image(:, :, :, 1) = imread('ur_c_s_03a_01_L_0376.png', 'png');
rgb_image(:, :, :, 2) = imread('ur_c_s_03a_01_L_0377.png', 'png');
rgb_image(:, :, :, 3) = imread('ur_c_s_03a_01_L_0378.png', 'png');
rgb_image(:, :, :, 4) = imread('ur_c_s_03a_01_L_0379.png', 'png');
rgb_image(:, : ,:, 5) = imread('ur_c_s_03a_01_L_0380.png', 'png');
rgb_image(:, :, :, 6) = imread('ur_c_s_03a_01_L_0381.png', 'png');

% Grayscale images:
figure
for i = 1:6
    gray_image(:, :, i) = rgb2gray(rgb_image(:, :, :, i));
    subplot(2, 3, i)
    imagesc(gray_image(:, :, i)), colormap gray, title(['Frame ', num2str(i)])
end
sgtitle('Grayscale images')


%% RED CAR
% Normalized Cross Correlation:

a = 320;
b = 450;
d = 665;
e = 795;

T=gray_image(320:450,665:795); %Show the template
figure,imagesc(T),colormap gray, title('RED CAR TEMPLATE')

for i = 1:6 % For each frame

red_car_area = gray_image(a:b, d:e, 1);
[xoffSet, yoffSet, xmax, ymax] = ncc(gray_image(:, :, i), red_car_area, 1);

        figure
        imagesc(gray_image(:, :, i)), colormap gray, title(['Frame ' num2str(i) ' with template of size 1' ])
        hold on
        rectangle('Position',[xoffSet+1 yoffSet+1 size(red_car_area, 2) size(red_car_area, 1)],'EdgeColor', 'r', 'LineWidth', 2)
        hold on
        plot(xmax, ymax, 'r*')
        
    
end


%% DARK CAR
% Normalized Cross Correlation:

a = 335;
b = 445;
d = 535;
e = 665;

T2=gray_image(335:445,535:665); %Show the template
figure,imagesc(T2),colormap gray, title('DARK CAR TEMPLATE')

for i = 1:6 % For each frame

    a = 335;
    b = 445;
    d = 535;
    e = 665;
    T2=gray_image(335:445,535:665); %Show the template
    dark_car_area = gray_image(a:b, d:e, 1);

    for j= 1:3 % For each size of the template
        [xoffSet, yoffSet, xmax, ymax] = ncc(gray_image(:, :, i), dark_car_area, j);

        figure
        imagesc(gray_image(:, :, i)), colormap gray, title(['Frame ' num2str(i) ' with template of size ' num2str(j)])
        hold on
        rectangle('Position',[xoffSet+1 yoffSet+1 size(dark_car_area, 2) size(dark_car_area, 1)],'EdgeColor', 'r', 'LineWidth', 2)
        hold on
        plot(xmax, ymax, 'r*')
        
        % Changing size of the template
        a = a + 20;
        b = b - 20;
        d = d + 20;
        e = e - 20;
        dark_car_area = gray_image(a:b, d:e, 1);
    end
end


%% Harris corner detection

tmp=imread('i235.png','png');
I=double(tmp);
figure,imagesc(I),colormap gray

%compute x and y derivative of the image using sobel kernel
dx=[1 0 -1; 2 0 -2; 1 0 -1]; 
dy=[1 2 1; 0  0  0; -1 -2 -1]; 
Ix=conv2(I,dx,'same'); %filtering
Iy=conv2(I,dy,'same');
figure,imagesc(Ix),colormap gray,title('Ix')
figure,imagesc(Iy),colormap gray,title('Iy')

%compute products of derivatives at every pixel
Ix2=Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy; 


%compute the sum of products of  derivatives at each pixel
%perform thw weighted sum with a gaussian in a region of 9 pixels: this
%allow us to find the components of the M matrix Sx and Sy
g = fspecial('gaussian', 9, 1.2);
figure,imagesc(g),colormap gray,title('Gaussian')
Sx2=conv2(Ix2,g,'same'); Sy2=conv2(Iy2,g,'same'); Sxy=conv2(Ixy,g,'same');

%features detection
[rr,cc]=size(Sx2);
edge_reg=zeros(rr,cc); corner_reg=zeros(rr,cc); flat_reg=zeros(rr,cc);
R_map=zeros(rr,cc); %cornerness map 
k=0.05; %choose the value of the constant (called alfa in the slides)


%for each pixel in the image (double loop) we define the M matrix   
for ii=1:rr 
    for jj=1:cc
        %define at each pixel x,y the matrix
        M=[Sx2(ii,jj),Sxy(ii,jj);Sxy(ii,jj),Sy2(ii,jj)]; %build M
        %compute the response of the detector at each pixel
        R=det(M) - k*(trace(M).^2); %compute the cornerness: tell us how much corner there are inside the image
        R_map(ii,jj)=R;
        %threshod on value of R
        R_MAX = 2.8199e+10; %chosen after have seen the R_map matrix: I have used the maximum value of R_map as requested, multiplied by 0.3
        if R<-0.3*R_MAX  
            edge_reg(ii,jj)=1;
        elseif R>0.3*R_MAX
            corner_reg(ii,jj)=1;
        else
            flat_reg(ii,jj)=1;
        end
    end
end

%Show the corner regions and the R score map
figure,imagesc(corner_reg.*I),colormap gray,title('corner regions')
figure,imagesc(R_map),colormap jet,title('R map')

%Show the detected corners overlapped to the image
log = logical(corner_reg);
s = regionprops(log,'centroid');
centroids = cat(1,s.Centroid);
figure,imagesc(I), colormap gray, title ('Detected corners overlapped to the image');
hold on
plot(centroids(:,1),centroids(:,2),'r*')
hold off

