img = imread('images/ADE_val_00000001.jpg');
imgBW = rgb2gray(img);

BW = imbinarize(imgBW);

% Find boundary of objects in image
[Boundaries,LabeledImg] = bwboundaries(BW,'noholes');
    % LabeledImg represents group number each pixel is assigned to

% Visualizing LabelImg
figure
imshow(label2rgb(LabeledImg, 'parula', [.5 .5 .5]))
hold on

% Visualizing edge on image
for k = 1:length(Boundaries)
   boundary = Boundaries{k};
   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 1)
end