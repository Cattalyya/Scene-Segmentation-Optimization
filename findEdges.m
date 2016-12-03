img = imread('images/ADE_val_00000001.jpg');
imgBW = rgb2gray(img);

% Edge detection
edgeImg = edge(imgBW, 'sobel');
figure
imshow(edgeImg);