%% Computer Vision Lab 6
% Fundamental matrix estimation
% Isabella-Sole Bisio S4113265

addpath('functions');

clear all
close all
clc

% Load images:
img1 = imread('Mire1.pgm');
img2 = imread('Mire2.pgm');
% img1 = imread('Rubik1.pgm');
% img2 = imread('Rubik2.pgm');

% Show images:
figure, imshow([img1 img2]);

% Load corresponding points:
p1 = load('Mire1.points')';
p2 = load('Mire2.points')';
% p1 = load('Rubik1.points')';
% p2 = load('Rubik2.points')';

n_points = length(p1(1, :)); % Total number of points

p1 = [p1; ones(1, n_points)]; % Add a row of ones at the points matrix
p2 = [p2; ones(1, n_points)]; % Add a row of ones at the points matrix

% Eight point algorithm function (version1)
F1 = EightPointsAlgorithm(p1, p2);

% Eight point algorithm function (version2)
F2 = EightPointsAlgorithmN(p1, p2);

% Evaluation of the results:
result1 = zeros(n_points, 1);
result2 = zeros(n_points, 1);
for i = 1 : n_points
    result1(i) = p2(:, i)'* F1* p1(:, i); % Check epipolar constraint for version 1 (using F1)
    result2(i) = p2(:, i)'* F2* p1(:, i); % Check epipolar constraint for version 2 (using F2)
end

% Visualisation of the epipolar lines (using the provided function)
visualizeEpipolarLines(img1, img2, F1, p1(1:2, :)', p2(1:2, :)')
visualizeEpipolarLines(img1, img2, F2, p1(1:2, :)', p2(1:2, :)')

% For method 1
[U1, D, V1] = svd(F1); % Perform singular value decomposition
rEpiPoles1 = U1(:,end) % Compute right epipoles
lEpiPoles1 = V1(:,end) % Compute left epipoles

% For metohd 2
[U2, D, V2] = svd(F2); % Perform singular value decomposition
rEpiPoles2 = U2(:,end) % Compute right epipoles
lEpiPoles2 = V2(:,end) % Compute left epipoles
