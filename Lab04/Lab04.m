%% Computer Vision Lab 4
% Color-based segmentation & Blob detection  
% Isabella-Sole Bisio S4113265

%In order to optimize the dimension of the program I wrote functions that
%can run for both the required cars, commenting and uncommenting some lines
%of code:
%if you want to run the code for the dark car please uncomment the "DARK
%CAR" section and comment "RED CAR" section of Lab04.m. Uncomment also the
%required lines of code for the dark car in "detect_car.m" "hue_evaluation.m" and 
%"segmentation.m" functions and comment the ones for the red car. Do the
%opposite in order to run the code for the red car.


addpath('functions');
clear all
close all
clc

%% Color-based segmentation

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

% Dividing into channels and saving the Hue component:
for i = 1:6
    hue_component(:, :, i) = dividing_channels(rgb_image(:, :, :, i), i);
end


 %% DARK car
  
   % Selecting image of frame 1:
   frame_chosen = 1;
   
   % Evaluating Hue component values of the car pixels:
   [m, s] = hue_evaluation(hue_component(:, :, frame_chosen)); % Mean and standard deviation
   
   % Segmenting the dark car:
   for i = 1:6
       [first_mask(:, :, i), seg(:, :, i)] = segmentation(hue_component(:, :, i), m, s, i);
       figure, imagesc(seg(:, :, i)), colormap gray, title(['Segmented dark car in frame ', num2str(i)])
   end
   
   % Detecting the car:
   
    figure
    for i = 1:6
        subplot(2, 3, i)
        detect_car(first_mask(:, :, i), seg(:, :, i), i);
    end
    sgtitle('Detected dark car')
    
     figure
    for i = 1:6
        subplot(2, 3, i)
        detect_car(rgb_image(:, :, :, 1), seg(:, :, i), i);
    end
    sgtitle('Detected dark car')
 
%% RED CAR
 
%   % Selecting image of frame 1:
%   frame_chosen = 1;
%   
%   % Evaluating Hue component values of the car pixels:
%   [m, s] = hue_evaluation(hue_component(:, :, frame_chosen)); % Mean and standard deviation
%   
%   % Segmenting the red car:
%   for i = 1:6
%       [first_mask(:, :, i), seg(:, :, i)] = segmentation(hue_component(:, :, i), m, s, i);
%       figure, imagesc(seg(:, :, i)), colormap gray, title(['Segmented red car in frame ', num2str(i)])
%   end
%   
%   % Detecting the car:
%   
%   figure
%   for i = 1:6
%       subplot(2, 3, i)
%       detect_car(first_mask(:, :, i), seg(:, :, i), i);
%   end
%   sgtitle('Detected red car')
%  
%  
%     figure
%    for i = 1:6
%        subplot(2, 3, i)
%        detect_car(rgb_image(:, :, :, 1), seg(:, :, i), i);
%    end
%    sgtitle('Detected red car')
%    
  
%% Blob detection


img=imread('sunflowers.png');
[h,w]=size(img);

sigma=1;%standard deviation of LoG THIS NUMBER DEPENDS ON THE SIZE OF THE OBJECT THAT I WANT TO IDENTIFY IN THE SCENE
n=10;%number of scales: how many number of filter I want to analyse the scene
scale_space = zeros(h,w,n);
%vectors to be filled for the left and right flower with the corrispondent
%value of the scale_space in the two points that I'm interested in.
left_sf= zeros (10,1); %left sunflower
right_sf= zeros (10,1); %right sunflower


for ii=1:n
    filt_size =  2*ceil(3*sigma)+1; % filter size
    LoG       =  sigma^2 * fspecial('log', filt_size, sigma); %scale-normalized Laplacian of Gaussian filter
    imFiltered = imfilter(img, LoG, 'same', 'replicate'); %produce the filtered image and I store it in my scale_space
    scale_space(:,:,ii)=abs(imFiltered); %x, y, scale
    left_sf(ii,1)=scale_space(362,166,ii);
    right_sf(ii,1)=scale_space(387,459,ii);
    
    radii(ii)=sigma; % I store the size of the object
    sigma=1.65*sigma; %then I increse the sigma
end

% I HAVE USED A SIGMA INCREMENT OF 1.65 INSTED OF 1.5 BECAUSE WITH THIS
% LAST VALUE THE LEFT SIDE SUNFLOWER WAS NOT DETECTED IN A UNIQUE IMAGE
% WITH THE RIGHT ONE


%Show Laplacian responses for the two highlighted sunflowers as a function of the scales
%Notice that the figures that appear have not got the shape of a gaussian since I have used just n=10 number of scales
figure, plot([radii], [left_sf]), xlabel('Scale (sigma)'), ylabel('Laplacian response'), title ('Characteristic scale graph for left sunflower')%for the left sunflower I have a peak in corrispondence of sigma=7.4120 that is its characteristic scale
figure, plot([radii], [right_sf]), xlabel('Scale (sigma)'), ylabel('Laplacian response'), title ('Characteristic scale graph for right sunflower')%for the right sunflower I have a peak in corrispondence of sigma=12.2298 that is its characteristic scale

%non-maxima suppression in scale-space: I do this loop to identifity for each pixel its maximum ; when we find a maximum we put to zero the area around the maximum for the size of the filter 
%non maxima suppression on x and y on a fixed scale
v=2;
vv=-v:v; %choose the initial size of the suppression area 
scale_space_nomax  = zeros(h,w,n); %create scale space with no maxima suppression
for ii=1:n 
    TMP=scale_space(:,:,ii);
    for hh=(1+v):1*v:(h-v)
        for ww=(1+v):1*v:(w-v) %double loop to check all the image ;non-maxima suppression in 2D spatial slice @fixed scale
            tmp=TMP(hh+vv,ww+vv);
            [m,i]=max(tmp(:)); %find the maximum in the area defined by the index vector vv
            a=zeros(length(vv));
            if m>55, a(i)=m;end %if the maximum is higher then a threshold I put the maximum in the middle of the area and zeros (vedi riga sopra) in the other parts
            TMP(hh+vv,ww+vv)=a;
            scale_space_nomax(hh+vv,ww+vv,ii)=a; %copy here what I have done in the previous line
        end
    end
    v=2*v; %increase the area where perform the non maxima suppression related to the size of the filter for that scale
    vv=-v:v;
end

%perform the last non maxima suppression in scale
blobs=zeros(h,w); 
for ii=1:h
    for jj=1:w
        tmp=scale_space_nomax(ii,jj,:); %non-maxima suppression in scale 
        [m,i]=max(tmp);
        if m>55, blobs(ii,jj)=radii(i);end
    end
end

[row,col,val] = find(blobs); %the blobs is where we have objects in the scene

figure
show_all_circles(img, col, row, 1.41*val, 'r', 1); %showcircle is a simple function that detects where there is the value and plot a circle around this value and the size is defined by the values that I pass to the function and is related to the standard deviation of the filter  



%I have looked at the image with all the cirlces and with the matlab tool I
%have identified the two centers of the two sunflowres that I was
%interested in. I have identified for each its x and y, I have looked at
%them in the corresponding col row val vectors in ordre to find the values
%to pass at the function "show_all_circles"

my_col= [166,459]';
my_row= [362,387]';
my_val= [7.4120,12.2298]';
figure
show_all_circles(img, my_col, my_row, 1.41*my_val, 'r', 1); 


%Characteristic scale

%We define the characteristic scale as the scale that produces peak of
%Laplacian response: it identifies the real size of an object, being sigma = radius / square root (2)

disp ('Characteristic scale of the left sunflower sigma = 7.4120')
disp ('Characteristic scale of the right sunflower sigma = 12.2298')
disp ('Radius of the left sunflower r = 1.41 * 7.4120 = 10.4509')
disp ('Radius of the right sunflower r = 1.41 * 12.2298 = 17.2440')




