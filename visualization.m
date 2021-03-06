% Visualize the results from experiments
close all; clc; clear;

% import helper functions
addpath(genpath('visualizationModule'));
addpath(genpath('functions/helper'));

% [gapLR gapTB], [marginB marginT], [marginL marginR]
subplot = @(m,n,p) subtightplot (m, n, p, [0 0.04], [0 0.02], [0.03 0.03]);

% load object names
load('objectName150.mat');
% load pre-defined colors 
load('color150.mat');

% read image
filename = '1'
fileImg = strcat('images/originalImages/',filename, '.jpg');
filePred = strcat('images/predictions/',filename, '.png');
% edge  avgEdge  neighborEdge  percentEdge
fileRefinedPred = strcat('images/refinedPredictions/edge/',filename, '.png');
fileAnno = strcat('images/annotations/',filename, '.png');
    
im = imread(fileImg);
imPred = imread(filePred);
imRefinedPred = imread(fileRefinedPred);
imAnno = imread(fileAnno);

% color encoding -> map object id to rgb color representation 
rgbPred = colorEncode(imPred, colors);
rgbRefinedPred = colorEncode(imRefinedPred, colors);
rgbAnno = colorEncode(imAnno, colors);

% colormaps 
colormap = colorMap(imPred, imAnno, objectNames);

% plot
set(gcf, 'Name', [fileImg ' [Press any key to the next image...]'],  'NumberTitle','off');

subplot(2,2,1);
imshow(im); title('a) Original Image');
% xlabh = xlabel('(1a)')
% % [LR Top ?]
% set(xlabh, 'Units', 'Normalized', 'Position', [0.5 -0.02 0]);

% subplot(2,2,2);
% imshow(colormap); title('Colormap');
subplot(2,2,2);
imshow(rgbAnno); title('b) Ground Truth');
subplot(2,2,3);
imshow(rgbPred); title('c) Demo Prediction');
subplot(2,2,4);
imshow(rgbRefinedPred); title('d) Refined Prediction');

