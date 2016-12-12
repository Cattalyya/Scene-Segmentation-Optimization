function edgeImg = findPercentEdge(imgBW,pc)
thres = prctile(imgBW,pc);
[Gmag,Gdir] = imgradient(imgBW);
edgeImg = Gmag >= thres;
end