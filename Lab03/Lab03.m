%% Computer Vision Lab 3
% Edge detection and Hough Transform   
% Isabella-Sole Bisio S4113265

addpath('functions');
clear all
close all
clc

%% First part of the Lab
%Load the image for the first part of the Lab 

boccadasse_color = imread('boccadasse.jpg', 'jpg'); 
boccadasse=rgb2gray(boccadasse_color);
figure, imagesc(boccadasse), colormap gray, title('Original image: boccadasse')


%% Laplacian of Gaussian

Z1 = laplacian_operator(1); % Standard deviaton of 1
Z2 = laplacian_operator(3.5); % Standard deviaton of 3.5
Z3 = laplacian_operator(2); % Standard deviaton of 2

figure,imagesc(Z1),colormap gray, title('2D LoG with sigma 1')
figure,surf(Z1), title('3D LoG with sigma 1')

figure,imagesc(Z2),colormap gray, title('2D LoG with sigma 3.5')
figure,surf(Z2), title('3D LoG with sigma 3.5')

figure,imagesc(Z3),colormap gray, title('2D LoG with sigma 2')
figure,surf(Z3), title('3D LoG with sigma 2')

figure
subplot(3, 2, 1)
imagesc(Z1), title('2D LoG with sigma 1')
subplot(3, 2, 2)
surf(Z1), title('3D LoG with sigma 1')
subplot(3, 2, 3)
imagesc(Z2), title('2D LoG with sigma 3.5')
subplot(3, 2, 4)
surf(Z2), title('3D LoG with sigma 3.5')
subplot(3, 2, 5)
imagesc(Z3), title('2D LoG with sigma 2')
subplot(3, 2, 6)
surf(Z3), title('3D LoG with sigma 2')
sgtitle('Laplacian of Gaussian')


%% Convolution of the image with Laplacian of Gaussian filters

% Boccadasse image
boccadasse_filtered_Z1 = conv2(boccadasse, Z1, 'same');
boccadasse_filtered_Z2 = conv2(boccadasse, Z2, 'same');
boccadasse_filtered_Z3 = conv2(boccadasse, Z3, 'same');

figure,imagesc(boccadasse_filtered_Z1),colormap gray, title('Boccadasse image convolved with LoG sigma=1')
figure,imagesc(boccadasse_filtered_Z2),colormap gray, title('Boccadasse image convolved with LoG sigma=3.5')
figure,imagesc(boccadasse_filtered_Z3),colormap gray, title('Boccadasse image convolved with LoG sigma=2')

figure
subplot(1, 3, 1)
imagesc(boccadasse_filtered_Z1),colormap gray, title('Boccadasse image convolved with LoG sigma=1')
subplot(1, 3, 2)
imagesc(boccadasse_filtered_Z2),colormap gray, title('Boccadasse image convolved with LoG sigma=3.5')
subplot(1, 3, 3)
imagesc(boccadasse_filtered_Z3),colormap gray, title('Boccadasse image convolved with LoG sigma=2')
sgtitle('Convolution of the images with Laplacian of Gaussian filters')


%% Edge detection

% Threshold = 0

boccasasse_detected_t0_fZ1 = edge_detection(0, boccadasse_filtered_Z1); %boccadasse image detected with threshold 0 and filter Z1
boccasasse_detected_t0_fZ2 = edge_detection(0, boccadasse_filtered_Z2); 
boccasasse_detected_t0_fZ3 = edge_detection(0, boccadasse_filtered_Z3); 

figure,imagesc(boccasasse_detected_t0_fZ1),colormap gray, title('Boccadasse image detected with threshold=0 (sigma=1)')
figure,imagesc(boccasasse_detected_t0_fZ2),colormap gray, title('Boccadasse image detected with threshold=0 (sigma=3.5)')
figure,imagesc(boccasasse_detected_t0_fZ3),colormap gray, title('Boccadasse image detected with threshold=0 (sigma=2)')

% Threshold = 2

boccasasse_detected_t2_fZ1 = edge_detection(2, boccadasse_filtered_Z1); 
boccasasse_detected_t2_fZ2 = edge_detection(2, boccadasse_filtered_Z2); 
boccasasse_detected_t2_fZ3 = edge_detection(2, boccadasse_filtered_Z3); 

figure,imagesc(boccasasse_detected_t2_fZ1),colormap gray, title('Boccadasse image detected with threshold=2 (sigma=1)')
figure,imagesc(boccasasse_detected_t2_fZ2),colormap gray, title('Boccadasse image detected with threshold=2(sigma=3.5)')
figure,imagesc(boccasasse_detected_t2_fZ3),colormap gray, title('Boccadasse image detected with threshold=2 (sigma=2)')

% Threshold = 4

boccasasse_detected_t4_fZ1 = edge_detection(4, boccadasse_filtered_Z1); 
boccasasse_detected_t4_fZ2 = edge_detection(4, boccadasse_filtered_Z2); 
boccasasse_detected_t4_fZ3 = edge_detection(4, boccadasse_filtered_Z3); 

figure,imagesc(boccasasse_detected_t4_fZ1),colormap gray, title('Boccadasse image detected with threshold=4 (sigma=1)')
figure,imagesc(boccasasse_detected_t4_fZ2),colormap gray, title('Boccadasse image detected with threshold=4 (sigma=3.5)')
figure,imagesc(boccasasse_detected_t4_fZ3),colormap gray, title('Boccadasse image detected with threshold=4 (sigma=2)')


 figure
 subplot(3, 3, 1)
 imagesc(boccasasse_detected_t0_fZ1),colormap gray, title('Boccadasse image detected with threshold=0 (sigma=1)')
 subplot(3, 3, 2)
 imagesc(boccasasse_detected_t0_fZ2),colormap gray, title('Boccadasse image detected with threshold=0 (sigma=3.5)')
 subplot(3, 3, 3)
 imagesc(boccasasse_detected_t0_fZ3),colormap gray, title('Boccadasse image detected with threshold=0 (sigma=2)')
 subplot(3, 3, 4)
 imagesc(boccasasse_detected_t2_fZ1),colormap gray, title('Boccadasse image detected with threshold=2 (sigma=1)')
 subplot(3, 3, 5)
 imagesc(boccasasse_detected_t2_fZ2),colormap gray, title('Boccadasse image detected with threshold=2 (sigma=3.5)')
 subplot(3, 3, 6)
 imagesc(boccasasse_detected_t2_fZ3),colormap gray, title('Boccadasse image detected with threshold=2 (sigma=2)')
 subplot(3, 3, 7)
 imagesc(boccasasse_detected_t4_fZ1),colormap gray, title('Boccadasse image detected with threshold=4 (sigma=1)')
 subplot(3, 3, 8)
 imagesc(boccasasse_detected_t4_fZ2),colormap gray, title('Boccadasse image detected with threshold=4 (sigma=3.5)')
 subplot(3, 3, 9)
 imagesc(boccasasse_detected_t4_fZ3),colormap gray, title('Boccadasse image detected with threshold=4 (sigma=2)')
 sgtitle('Edge detection')
 

%% Comparison with function edge('log'...)

[function_edge_boccadasse, threshold_check] = edge(boccadasse, 'log'); % In order to check the value of threshold

Z4 = laplacian_operator(2); % The defalut value of sigma for function edge() of Matlab is 2
boccadasse_convolution = conv2(boccadasse, Z4, 'same'); 
our_algorithm = edge_detection(0.0063, boccadasse_convolution); % Threshold of 0.0063 is the value of threshold_check

figure
pos1 = [0.1 0.3 0.35 0.35];
pos2 = [0.55 0.3 0.35 0.35];
subplot('Position', pos1)
imagesc(our_algorithm), colormap gray, title('Algorithm implemented')
subplot('Position', pos2)
imagesc(function_edge_boccadasse), colormap gray, title('Function "edge"')
sgtitle('Comparison')


%% Second part of the Lab: Hough transform 

%Highway1

highway1_color = imread('highway1.jpg', 'jpg'); 
highway1=rgb2gray(highway1_color);
figure, imagesc(highway1), colormap gray, title('Original image: highway1')
I=double(highway1);
[rr,cc]=size(I);
%Edge detection
BW = edge(I,'sobel');
figure,imshow(BW)
%Hough transform
%This function works on the binary image of the edge
[H,T,R] = hough(BW);%H:   the Hough transform matrix;
                    %T,R: the values over which the Hough transform matrix
                    %was generated
%Returns the values where are stored the parameters H matrix, T teta martix, R radius matrix (d of slides)                   
figure,imagesc(H),colormap pink

%%%Identify peaks in Hough transform
%pay attention because there is not just one maxima because there is noise

P  = houghpeaks(H,4);%4 is  the maximum number of peaks to identify
                     %P  row and column coordinates of the peaks: coordinates where there are maxima
%H
figure,imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
colormap pink
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%peaks
x = T(P(:,2)); y = R(P(:,1)); %identify x and y in order to find straight lines 
plot(x,y,'s','color','yellow'); %coord of maxima with squares 

%%%Compute straight lines and plot them
%compute straight lines still in polar form 
figure, imshow(BW), hold on
for k=1:length(P)
    if T(P(k,2))>-45 && T(P(k,2))<45
        x1=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - 1*tan(deg2rad(T(P(k,2))));
        x2=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - cc*tan(deg2rad(T(P(k,2))));
        plot([x1,x2],[1 cc],'LineWidth',2,'Color','yellow');
    else
        y1=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - 1/tan(deg2rad(T(P(k,2))));
        y2=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - rr/tan(deg2rad(T(P(k,2))));
        plot([1,rr],[y1 y2],'LineWidth',2,'Color','red');
    end
end

%%%Find line segments and plot them : real edges of the image; some straight lines of the precedent image are cut because in the reality there are not straight lines  
lines = houghlines(BW,T,R,P,'FillGap',10,'MinLength',30); %this function considers a straight line where there is a match between the straight line in the mathematical form and the edge  
%'FillGap' means we consider valid the edge up to a hole of 10 pixels (9 pixels without edge and 1 with edge), 'MinLength' discard all the segments that are below 30 pixels    
figure, imshow(highway1), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end



%Highway2

highway2_color = imread('highway2.jpg', 'jpg'); 
highway2=rgb2gray(highway2_color);
figure, imagesc(highway2), colormap gray, title('Original image: highway2')
I=double(highway2);
[rr,cc]=size(I);
%Edge detection
BW = edge(I,'sobel');
figure,imshow(BW)
%Hough transform
%This function works on the binary image of the edge
[H,T,R] = hough(BW);%H:   the Hough transform matrix;
                    %T,R: the values over which the Hough transform matrix
                    %was generated
%Returns the values where are stored the parameters H matrix, T teta martix, R radius matrix (d of slides)                   
figure,imagesc(H),colormap pink

%%%Identify peaks in Hough transform
%pay attention because there is not just one maxima because there si noise: so each straight line in the image hasa block of points in the parametric space wich have very high values but we don't have to consider all of them (because this variety is due to the noise). So we have to find the maximum 
%and chose and area around this maximum in order to discard it in order to
%find the second maximum
%this is the reason why we shold use HOUGHPEAKS a function that finds the
%maximum inside H matrix 

P  = houghpeaks(H,5, 'NHoodSize', [21 21]);%5 is  the maximum number of peaks to identify
                     %P  row and column coordinates of the peaks:
                     %coordinates where there are maxima
%H
figure,imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
colormap pink
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%peaks
x = T(P(:,2)); y = R(P(:,1)); %identify x and y in order to find straight lines 
plot(x,y,'s','color','yellow'); %coord of maxima with squares 

%%%Compute straight lines and plot them
%compute straight lines still in polar form 
figure, imshow(BW), hold on
for k=1:length(P)
    if T(P(k,2))>-45 && T(P(k,2))<45
        x1=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - 1*tan(deg2rad(T(P(k,2))));
        x2=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - cc*tan(deg2rad(T(P(k,2))));
        plot([x1,x2],[1 cc],'LineWidth',2,'Color','yellow');
    else
        y1=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - 1/tan(deg2rad(T(P(k,2))));
        y2=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - rr/tan(deg2rad(T(P(k,2))));
        plot([1,rr],[y1 y2],'LineWidth',2,'Color','red');
    end
end

%%%Find line segments and plot them : real edges of the image; some straight lines of the precedent image are cut because in the reality there are not straight lines  
lines = houghlines(BW,T,R,P,'FillGap',10,'MinLength',30); %this function considers a straight line where there is a match between the straight line in the mathematical form and the edge  
%'FillGap' means we consider valid the edge up to a hole of 10 pixels (9 pixels without edge and 1 with edge), 'MinLength' discard all the segments that are below 30 pixels    
figure, imshow(highway2), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end


