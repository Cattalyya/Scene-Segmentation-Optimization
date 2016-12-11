function edgeImg = findEdge(imgBW, thres)
[Gmag,Gdir] = imgradient(imgBW);
edgeImg = Gmag >= thres;
end