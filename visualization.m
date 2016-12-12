% Visualize the results from experiments
close all; clc; clear;

% import helper functions
addpath(genpath('visualizationModule'));

% load object names
load('objectName150.mat');
% load pre-defined colors 
load('color150.mat');

% read image
fileImg = 'images/originalImages/1.jpg';
filePred = 'images/predictions/1.png';
fileRefinedPred = 'images/refinedPredictions/1.png';
fileAnno = 'images/annotations/1.png';

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

subplot(231);
imshow(im); title('Image');
subplot(232);
imshow(colormap); title('Colormap');
subplot(234);
imshow(rgbPred); title('Prediction');
subplot(235);
imshow(rgbRefinedPred); title('BFS-Refined-Prediction');
subplot(236);
imshow(rgbAnno); title('Annotation');

