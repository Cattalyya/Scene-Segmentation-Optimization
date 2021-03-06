addpath(genpath('../visualizationModule'));

imageFilename = '6';
predPath = '../images/predictions/';

load('color150.mat');

img1 = resizeImageToMatchOriginal(imageFilename);
grayPrediction = dataEncode(img1, colors);

imwrite(grayPrediction, strcat(predPath, imageFilename,'.png'))
