function resizedImg = resizeImageToMatchOriginal(imageFilename)
    
    imPath = '../images/annotations/';
    rawPath = '../images/rawPredictions/';
    
    img = imread(strcat(imPath,imageFilename,'.png'));       % actual image
    rawImg = imread(strcat(rawPath,imageFilename,'.png'));  
    % image results saved from http://scenesegmentation.csail.mit.edu (image have different size from the actual image)
    
    sizeImg = size(img);
    resizedImg = imresize(rawImg,sizeImg,'nearest');
    
end