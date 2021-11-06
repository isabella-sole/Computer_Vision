%% Computer Vision Lab 2
% Image filtering and Fourier Transform   
% Isabella-Sole Bisio S4113265

addpath('functions');
clear all
close all
clc

%% Load images

img1=imread('i235.png','png'); %imread allows you import any kind of image 
figure,imagesc(img1),colormap gray,title('i235 original') %initial image
figure, imhist(uint8(img1), 256), title('Histogram i235 original') % displaying histogram

img2=imread('tree.png','png'); 
figure,imagesc(img2),colormap gray,title('Tree original') %initial image
figure, imhist(uint8(img2), 256), title('Histogram Tree original') % displaying histogram


%% Add Gaussian (standard deviation=20) and salt & pepper (density=20%) noise 

%Gaussian noise
img1_g= gaussian_noise(img1, 20);
figure,imagesc(img1_g),colormap gray,title('i235 gaussian noise')
figure, imhist(uint8(img1_g), 256), title('Histogram i235 gaussian noise') % displaying histogram

img2_g = gaussian_noise(img2, 20);
figure,imagesc(img2_g),colormap gray,title('Tree gaussian noise')
figure, imhist(uint8(img2_g), 256), title('Histogram Tree gaussian noise') % displaying histogram

%Salt and pepper noise
img1_sp = saltpepper_noise (img1,0.2);
figure,imagesc(img1_sp),colormap gray,title('i235 salt and pepper noise')
figure, imhist(uint8(img1_sp), 256), title('Histogram i235 salt and pepper noise')

img2_sp = saltpepper_noise (img2,0.2);
figure,imagesc(img2_sp),colormap gray,title('Tree salt and pepper noise')
figure, imhist(uint8(img2_sp), 256), title('Histogram Tree salt and pepper noise')


%% Remove the noise by using a moving average, a low-pass Gaussian filter and a median filter

%Moving average filter

%for i235 image with gaussian noise
img1_g_movav3 = moving_average(img1_g,3); %3x3 pixels
figure, imagesc(img1_g_movav3), colormap gray, title('Smoothing gaussian noise by averaging (3x3)')
figure, imhist(uint8(img1_g_movav3), 256), title('Histogram smoothing gaussian noise by averaging (3x3)') % displaying histogram

img1_g_movav7 = moving_average(img1_g,7); %7x7 pixels
figure, imagesc(img1_g_movav7), colormap gray, title('Smoothing gaussian noise by averaging (7x7)')
figure, imhist(uint8(img1_g_movav7), 256), title('Histogram smoothing gaussian noise by averaging (7x7)') % displaying histogram

%for tree image with gaussian noise
img2_g_movav3 = moving_average(img2_g,3); %3x3 pixels
figure, imagesc(img2_g_movav3), colormap gray, title('Smoothing gaussian noise by averaging (3x3)')
figure, imhist(uint8(img2_g_movav3), 256), title('Histogram smoothing gaussian noise by averaging (3x3)') % displaying histogram

img2_g_movav7 = moving_average(img2_g,7); %7x7 pixels
figure, imagesc(img2_g_movav7), colormap gray, title('Smoothing gaussian noise by averaging (7x7)')
figure, imhist(uint8(img2_g_movav7), 256), title('Histogram smoothing gaussian noise by averaging (7x7)') % displaying histogram

%for i235 image with salt and pepper noise
img1_sp_movav3 = moving_average(img1_sp,3); %3x3 pixels
figure, imagesc(img1_sp_movav3), colormap gray, title('Smoothing salt and pepper noise by averaging (3x3)')
figure, imhist(uint8(img1_sp_movav3), 256), title('Histogram smoothing salt and pepper noise by averaging (3x3)') % displaying histogram

img1_sp_movav7 = moving_average(img1_sp,7); %7x7 pixels
figure, imagesc(img1_sp_movav7), colormap gray, title('Smoothing salt and pepper noise noise by averaging (7x7)')
figure, imhist(uint8(img1_sp_movav7), 256), title('Histogram smoothing salt and pepper noise noise by averaging (7x7)') % displaying histogram

%for tree image with salt and pepper noise
img2_sp_movav3 = moving_average(img2_sp,3); %3x3 pixels
figure, imagesc(img2_sp_movav3), colormap gray, title('Smoothing salt and pepper noise by averaging (3x3)')
figure, imhist(uint8(img2_sp_movav3), 256), title('Histogram smoothing salt and pepper noise by averaging (3x3)') % displaying histogram

img2_sp_movav7 = moving_average(img2_sp,7); %7x7 pixels
figure, imagesc(img2_sp_movav7), colormap gray, title('Smoothing salt and pepper noise noise by averaging (7x7)')
figure, imhist(uint8(img2_sp_movav7), 256), title('Histogram smoothing salt and pepper noise noise by averaging (7x7)') % displaying histogram


%Low-pass Gaussian filter 

%for i235 image with gaussian noise
img1_g_gf3 = gaussian_filter(img1_g,3); %3x3 pixels
figure, imagesc(img1_g_gf3), colormap gray, title('Smoothing gaussian noise by gaussian filter (3x3)')
figure, imhist(uint8(img1_g_gf3), 256), title('Histogram smoothing gaussian noise by gaussian filter (3x3)') % displaying histogram

img1_g_gf7 = gaussian_filter(img1_g,7); %7x7 pixels
figure, imagesc(img1_g_gf7), colormap gray, title('Smoothing gaussian noise by gaussian filter (7x7)')
figure, imhist(uint8(img1_g_gf7), 256), title('Histogram smoothing gaussian noise by gaussian filter (7x7)') % displaying histogram

%for tree image with gaussian noise
img2_g_gf3 = gaussian_filter(img2_g,3); %3x3 pixels
figure, imagesc(img2_g_gf3), colormap gray, title('Smoothing gaussian noise by gaussian filter (3x3)')
figure, imhist(uint8(img2_g_gf3), 256), title('Histogram smoothing gaussian noise by gaussian filter (3x3)') % displaying histogram

img2_g_gf7 = gaussian_filter(img2_g,7); %7x7 pixels
figure, imagesc(img2_g_gf7), colormap gray, title('Smoothing gaussian noise by gaussian filter (7x7)')
figure, imhist(uint8(img2_g_gf7), 256), title('Histogram smoothing gaussian noise by gaussian filter (7x7)') % displaying histogram

%for i235 image with salt and pepper noise
img1_sp_gf3 = gaussian_filter(img1_sp,3); %3x3 pixels
figure, imagesc(img1_sp_gf3), colormap gray, title('Smoothing salt and pepper noise by gaussian filter (3x3)')
figure, imhist(uint8(img1_sp_gf3), 256), title('Histogram smoothing salt and pepper noise by gaussian filter (3x3)') % displaying histogram

img1_sp_gf7 = gaussian_filter(img1_sp,7); %7x7 pixels
figure, imagesc(img1_sp_gf7), colormap gray, title('Smoothing salt and pepper noise noise by gaussian filter (7x7)')
figure, imhist(uint8(img1_sp_gf7), 256), title('Histogram smoothing salt and pepper noise noise by gaussian filter (7x7)') % displaying histogram

%for tree image with salt and pepper noise
img2_sp_gf3 = gaussian_filter(img2_sp,3); %3x3 pixels
figure, imagesc(img2_sp_gf3), colormap gray, title('Smoothing salt and pepper noise by gaussian filter (3x3)')
figure, imhist(uint8(img2_sp_gf3), 256), title('Histogram smoothing salt and pepper noise by gaussian filter (3x3)') % displaying histogram

img2_sp_gf7 = gaussian_filter(img2_sp,7); %7x7 pixels
figure, imagesc(img2_sp_gf7), colormap gray, title('Smoothing salt and pepper noise noise by gaussian filter (7x7)')
figure, imhist(uint8(img2_sp_gf7), 256), title('Histogram smoothing salt and pepper noise noise by gaussian filter (7x7)') % displaying histogram


%Median filter

%for i235 image with gaussian noise
img1_g_mf3 = median_filter(img1_g,3); %3x3 pixels
figure, imagesc(img1_g_mf3), colormap gray, title('Smoothing gaussian noise by median filter (3x3)')
figure, imhist(uint8(img1_g_mf3), 256), title('Histogram smoothing gaussian noise by median  filter (3x3)') % displaying histogram

img1_g_mf7 = median_filter(img1_g,7); %7x7 pixels
figure, imagesc(img1_g_mf7), colormap gray, title('Smoothing gaussian noise by median  filter (7x7)')
figure, imhist(uint8(img1_g_mf7), 256), title('Histogram smoothing gaussian noise by median  filter (7x7)') % displaying histogram

%for tree image with gaussian noise
img2_g_mf3 = median_filter(img2_g,3); %3x3 pixels
figure, imagesc(img2_g_mf3), colormap gray, title('Smoothing gaussian noise by median  filter (3x3)')
figure, imhist(uint8(img2_g_mf3), 256), title('Histogram smoothing gaussian noise by median  filter (3x3)') % displaying histogram

img2_g_mf7 = median_filter(img2_g,7); %7x7 pixels
figure, imagesc(img2_g_mf7), colormap gray, title('Smoothing gaussian noise by median  filter (7x7)')
figure, imhist(uint8(img2_g_mf7), 256), title('Histogram smoothing gaussian noise by median  filter (7x7)') % displaying histogram

%for i235 image with salt and pepper noise
img1_sp_mf3 = median_filter(img1_sp,3); %3x3 pixels
figure, imagesc(img1_sp_mf3), colormap gray, title('Smoothing salt and pepper noise by median  filter (3x3)')
figure, imhist(uint8(img1_sp_mf3), 256), title('Histogram smoothing salt and pepper noise by median  filter (3x3)') % displaying histogram

img1_sp_mf7 = median_filter(img1_sp,7); %7x7 pixels
figure, imagesc(img1_sp_mf7), colormap gray, title('Smoothing salt and pepper noise noise by median  filter (7x7)')
figure, imhist(uint8(img1_sp_mf7), 256), title('Histogram smoothing salt and pepper noise noise by median  filter (7x7)') % displaying histogram

%for tree image with salt and pepper noise
img2_sp_mf3 = median_filter(img2_sp,3); %3x3 pixels
figure, imagesc(img2_sp_mf3), colormap gray, title('Smoothing salt and pepper noise by median  filter (3x3)')
figure, imhist(uint8(img2_sp_mf3), 256), title('Histogram smoothing salt and pepper noise by median  filter (3x3)') % displaying histogram

img2_sp_mf7 = median_filter(img2_sp,7); %7x7 pixels
figure, imagesc(img2_sp_mf7), colormap gray, title('Smoothing salt and pepper noise noise by median  filter (7x7)')
figure, imhist(uint8(img2_sp_mf7), 256), title('Histogram smoothing salt and pepper noise noise by median filter (7x7)') % displaying histogram


%% Practice with linear filters; slides 41-45

% Impulse filter (Delta of Dirac)
% for i235 image
img1_g_lf1 = linear_filter(img1_g, 7, 1);
figure, imagesc(img1_g_lf1), colormap gray, title('Smoothing gaussian noise with impulse filter')
figure, imhist(uint8(img1_g_lf1), 256), title('Histogram smoothing gaussian noise with impulse filter') % displaying histogram

img1_sp_lf1 = linear_filter(img1_sp, 7, 1);
figure, imagesc(img1_sp_lf1), colormap gray, title('Smoothing salt and pepper noise with impulse filter')
figure, imhist(uint8(img1_sp_lf1), 256), title('Histogram smoothing salt and pepper noise with impulse filter') % displaying histogram

% for tree image
img2_g_lf1 = linear_filter(img2_g, 7, 1);
figure, imagesc(img2_g_lf1), colormap gray, title('Smoothing gaussian noise with impulse filter')
figure, imhist(uint8(img2_g_lf1), 256), title('Histogram smoothing gaussian noise with impulse filter') % displaying histogram

img2_sp_lf1 = linear_filter(img2_sp, 7, 1);
figure, imagesc(img2_sp_lf1), colormap gray, title('Smoothing salt and pepper noise with impulse filter')
figure, imhist(uint8(img2_sp_lf1), 256), title('Histogram smoothing salt and pepper noise with impulse filter') % displaying histogram



% Shifted left filter 
% for i235 image
img1_g_lf2 = linear_filter(img1_g, 7, 2);
figure, imagesc(img1_g_lf2), colormap gray, title('Smoothing gaussian noise with shifted left filter')
figure, imhist(uint8(img1_g_lf2), 256), title('Histogram smoothing gaussian noise with shifted left filter') % displaying histogram

img1_sp_lf2 = linear_filter(img1_sp, 7, 2);
figure, imagesc(img1_sp_lf2), colormap gray, title('Smoothing salt and pepper noise with shifted left filter')
figure, imhist(uint8(img1_sp_lf2), 256), title('Histogram smoothing salt and pepper noise with shifted left filter') % displaying histogram


% for tree image
img2_g_lf2 = linear_filter(img2_g, 7, 2);
figure, imagesc(img2_g_lf2), colormap gray, title('Smoothing gaussian noise with shifted left filter')
figure, imhist(uint8(img2_g_lf2), 256), title('Histogram smoothing gaussian noise with shifted left filter') % displaying histogram

img2_sp_lf2 = linear_filter(img2_sp, 7, 2);
figure, imagesc(img2_sp_lf2), colormap gray, title('Smoothing salt and pepper noise with shifted left filter')
figure, imhist(uint8(img2_sp_lf2), 256), title('Histogram smoothing salt and pepper noise with shifted left filter') % displaying histogram



% Bluring filter
%for i235 image
img1_g_lf3 = linear_filter(img1_g, 7, 3);
figure, imagesc(img1_g_lf3), colormap gray, title('Smoothing gaussian noise with bluring filter')
figure, imhist(uint8(img1_g_lf3), 256), title('Histogram smoothing gaussian noise with bluring filter') % displaying histogram

img1_sp_lf3 = linear_filter(img1_sp, 7, 3);
figure, imagesc(img1_sp_lf3), colormap gray, title('Smoothing salt and pepper noise with bluring filter')
figure, imhist(uint8(img1_sp_lf3), 256), title('Histogram smoothing salt and pepper noise with bluring filter') % displaying histogram

%for tree image
img2_g_lf3 = linear_filter(img2_g, 7, 3);
figure, imagesc(img2_g_lf3), colormap gray, title('Smoothing gaussian noise with bluring filter')
figure, imhist(uint8(img2_g_lf3), 256), title('Histogram smoothing gaussian noise with bluring filter') % displaying histogram

img2_sp_lf3 = linear_filter(img2_sp, 7, 3);
figure, imagesc(img2_sp_lf3), colormap gray, title('Smoothing salt and pepper noise with bluring filter')
figure, imhist(uint8(img2_sp_lf3), 256), title('Histogram smoothing salt and pepper noise with bluring filter') % displaying histogram


% Sharpening filter
% for i235 image
img1_g_lf4 = linear_filter(img1_g, 7, 4);
figure, imagesc(img1_g_lf4), colormap gray, title('Smoothing gaussian noise with sharpening filter')
figure, imhist(uint8(img1_g_lf4), 256), title('Histogram smoothing gaussian noise with sharpening filter') % displaying histogram

img1_sp_lf4 = linear_filter(img1_sp, 7, 4);
figure, imagesc(img1_sp_lf4), colormap gray, title('Smoothing salt and pepper noise with sharpening filter')
figure, imhist(uint8(img1_sp_lf4), 256), title('Histogram smoothing salt and pepper noise with sharpening filter') % displaying histogram

%for tree image
img2_g_lf4 = linear_filter(img2_g, 7, 4);
figure, imagesc(img2_g_lf4), colormap gray, title('Smoothing gaussian noise with sharpening filter')
figure, imhist(uint8(img2_g_lf4), 256), title('Histogram smoothing gaussian noise with sharpening filter') % displaying histogram

img2_sp_lf4 = linear_filter(img2_sp, 7, 4);
figure, imagesc(img2_sp_lf4), colormap gray, title('Smoothing salt and pepper noise with sharpening filter')
figure, imhist(uint8(img2_sp_lf4), 256), title('Histogram smoothing salt and pepper noise with sharpening filter') % displaying histogram


%% Apply the Fourier Transform (FFT) 

% Display the magnitude (log) of the transformed images;
FZ = fftshift(fft2(img1)); %shift the zero frequencies component to center of spectrum of the image and apply fft
figure, imagesc(abs(FZ)), colormap gray, title('Image FFT')
figure, mesh(abs(FZ)), title('Image FFT')

% Display the magnitude of the transformed low-pass Gaussian filter (spatial support of 101x101 pixels with sigma=5)
FH = fspecial('gaussian', 101, 5);
FFZ = fftshift(fft2(FH));
figure, imagesc(abs(FFZ)), colormap gray, title('Gauss FFT')
figure, mesh(abs(FFZ)), title('Gauss FFT')

% Display the magnitude of the transformed sharpening filter (spatial support of 7x7 pixels, copy it in the middle of a zeros image of 101x101 pixels)
filter_size = 7;
center = ceil(filter_size/2);
K = zeros(filter_size);       
K(center, center) = 2;
K = K - (ones(filter_size)/(filter_size^2));
Z=zeros(101);
Z(53:59,53:59)=K;
FFFZ = fftshift(fft2(Z));
figure, imagesc(abs(FFFZ)), colormap gray, title('Sharpening FFT')
figure, mesh(abs(FFFZ)), title('Sharpening FFT')



