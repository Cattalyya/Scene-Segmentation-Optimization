function edgeImg = findEdge(imgBW, thres)
[Gmag,Gdir] = imgradient(imgBW);
% avg = mean(mean(imgBW));
edgeImg = Gmag >= thres;
end