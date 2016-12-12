img = imread('experiment/result/ADE_val_00000002_visual_predict.png');

imgBW = rgb2gray(img);

% Edge detection
edgeImg = edge(imgBW, 'sobel',0.1 );
imshow(edgeImg);

% Find image gradient
[Gmag,Gdir] = imgradient(imgBW);
gradientEdgeImg = Gmag > 20;
figure
imshow(gradientEdgeImg);