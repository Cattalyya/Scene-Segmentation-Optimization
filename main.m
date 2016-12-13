% import helper functions 
addpath(genpath('functions/edgeDetection'));
addpath(genpath('functions/evaluation'));
addpath(genpath('functions/helper'));

imPath = 'images/originalImages/';
predPath = 'images/predictions/';
annoPath = 'images/annotations/';
cnt = 1;
subplot = @(m,n,p) subtightplot (m, n, p, [0 0.04], [0 0.02], [0.01 0.01]);
figure
for filename = ['1' '2' '3' '4' '5' '6']
    img = imread(strcat(imPath,filename,'.jpg'));       % RGB img
    imgBW = rgb2gray(img);                              % grayscale img
    predImg = imread(strcat(predPath,filename,'.png')); % label prediction img
    annoImg = imread(strcat(annoPath,filename,'.png')); % ground truth

    % plot original
    subplot(10,6,cnt);
    imshow(img);
    %% Sobel %%%%%
    sobel = edge(imgBW,'sobel');
    % imwrite(edgeImg, strcat('sobel_',filename,'.png'));

    %% Canny %%%%%
    canny = edge(imgBW,'canny');
    % imwrite(edgeImg, strcat('canny_',filename,'.png'));

    %% Gradient Thresholding %%%%%
    EdgeImg10 = findEdge(imgBW,10);   % hard-code values
    EdgeImg30 = findEdge(imgBW,30);   % hard-code values
    EdgeImg50 = findEdge(imgBW,50);   % hard-code values
    AEdgeImg = findAvgEdge(imgBW,1); % average values
    AEdgeImg3 = findAvgEdge(imgBW,3); % average values
    AEdgeImg5 = findAvgEdge(imgBW,5); % average values
    PEdgeImg30 = findPercentEdge(imgBW,30);  % certain percentile
    PEdgeImg70 = findPercentEdge(imgBW,70);  % certain percentile
    NEdgeImg20 = findNeighborEdge(imgBW,20, 1);  % neighbor average
    NEdgeImg40 = findNeighborEdge(imgBW,40, 1);  % neighbor average
    NEdgeImg20_3 = findNeighborEdge(imgBW,20, 3);  % neighbor average
    NEdgeImg40_3 = findNeighborEdge(imgBW,40, 3);  % neighbor average

    newEdgeImg10 = regroup(predImg, EdgeImg10);
    newEdgeImg30 = regroup(predImg, EdgeImg30);
    newEdgeImg50 = regroup(predImg, EdgeImg50);
    newAEdgeImg  = regroup(predImg, AEdgeImg);
    newAEdgeImg3  = regroup(predImg, AEdgeImg3);
    newAEdgeImg5  = regroup(predImg, AEdgeImg5);
    newPEdgeImg30 = regroup(predImg, PEdgeImg30);
    newPEdgeImg70 = regroup(predImg, PEdgeImg70);
    newNEdgeImg20 = regroup(predImg, NEdgeImg20);
    newNEdgeImg40 = regroup(predImg, NEdgeImg40);
    newNEdgeImg20_3 = regroup(predImg, NEdgeImg20_3);
    newNEdgeImg40_3 = regroup(predImg, NEdgeImg40_3);

    filename
    
    tmpp = cnt + 6;
    imwrite(predImg, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newEdgeImg10, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newEdgeImg30, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newEdgeImg50, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newAEdgeImg, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newAEdgeImg3, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newAEdgeImg5, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newPEdgeImg30, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newPEdgeImg70, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newNEdgeImg20, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newNEdgeImg40, strcat('tmp/', int2str(tmpp), '.png'));tmpp = tmpp + 6;
    imwrite(newNEdgeImg20_3, strcat('tmp/', int2str(tmpp), '.png')); tmpp = tmpp + 6;
    imwrite(newNEdgeImg40_3, strcat('tmp/', int2str(tmpp), '.png'));tmpp = tmpp + 6;
    
    cnt =  cnt + 1;

    % newPredImg = regroup(predImg, edgeImg);
    % figure
    % imshow(newPredImg);
    % imwrite(newPredImg, strcat('images/refinedPredictions/edge/',filename,'.png'));
end