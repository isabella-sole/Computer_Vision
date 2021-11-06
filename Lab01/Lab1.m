%% Computer Vision Lab 1
% Image backward warping and bilinear interpolation   
% Isabella-Sole Bisio S4113265

addpath('functions');
clear all
close all
clc

%% Load images

img1=imread('boccadasse.jpg','jpg'); %imread allows you import any kind of image 
figure,imagesc(img1),title('boccadasse original') %initial image
img1_gray=rgb2gray(img1);
figure,imagesc(img1_gray),colormap gray,title('boccadasse gray') %initial image on gray map

img2=imread('flower.jpg','jpg'); 
figure,imagesc(img2),title('flower original') %initial image
img2_gray=rgb2gray(img2);
figure,imagesc(img2_gray),colormap gray,title('flower gray') %initial image on gray map


%% Perform translation
 
img1_grayTranslated= translation(img1_gray,100,100);
figure,imagesc(img1_grayTranslated),colormap gray,title('boccadasse gray translated')

img2_grayTranslated= translation(img2_gray,20,30);
figure,imagesc(img2_grayTranslated),colormap gray,title('flower gray translated')


%% Perform rotation

% angle = pi/4
img1_grayRotated= rotation(img1_gray,pi/4);
figure,imagesc(img1_grayRotated),colormap gray,title('boccadasse gray rotated')

img2_grayRotated= rotation(img2_gray,pi/4);
figure,imagesc(img2_grayRotated),colormap gray,title('flower gray rotated')

% angle = (-pi/4)
img1_grayRotated= rotation(img1_gray,(-pi/4));
figure,imagesc(img1_grayRotated),colormap gray,title('boccadasse gray rotated')

img2_grayRotated= rotation(img2_gray,(-pi/4));
figure,imagesc(img2_grayRotated),colormap gray,title('flower gray rotated')


%% Perform waving 

img1_grayWaved= waving1(img1_gray);
figure,imagesc(img1_grayWaved),colormap gray,title('boccadasse gray waved')

img2_grayWaved= waving2(img2_gray);
figure,imagesc(img2_grayWaved),colormap gray,title('flower gray waved')
