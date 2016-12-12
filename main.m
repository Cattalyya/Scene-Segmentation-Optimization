addpath(genpath('functions/edgeDetection'));
addpath(genpath('functions/evaluation'));

imPath = 'images/originalImages/';
predPath = 'images/predictions/';
annoPath = 'images/annotations/';
filename = '1';

img = imread(strcat(imPath,filename,'.jpg'));       % RGB img
imgBW = rgb2gray(img);                              % grayscale img
predImg = imread(strcat(predPath,filename,'.png')); % label prediction img
annoImg = imread(strcat(annoPath,filename,'.png')); % ground truth

%% Sobel %%%%%
% edgeImg = edge(imgBW,'sobel')

%% Canny %%%%%
% edgeImg = edge(imgBW,'canny')

%% Gradient Thresholding %%%%%
edgeImg = findEdge(imgBW,50);   % hard-code values
% edgeImg = findAvgEdge(imgBW); % average values
% edgeImg = findPercentEdge(imgBW,75);  % certain percentile
% edgeImg = findNeighborEdge(imgBW,5);  % neighbor average

newPredImg = regroup(predImg, edgeImg);
figure
imshow(newPredImg);
imwrite(newPredImg, strcat('images/refinedPredictions/',filename,'.png'));
