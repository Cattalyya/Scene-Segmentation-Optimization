
function success = visualizeFolder(folderPath,totalImg)

    % import helper functions
    addpath(genpath('../../visualizationModule'));

    % load pre-defined colors 
    load('color150.mat');

    for i = 1: totalImg

        % read image
        filename = str(i)
        fileImg = strcat(folderPath,filename, '.jpg');

        im = imread(fileImg);

        % color encoding -> map object id to rgb color representation 
        rgbImg = colorEncode(im, colors);

        imwrite( rgbImg ,strcat(folderPath,'/visualizedImages/',filename, '.png'))

    end


end

