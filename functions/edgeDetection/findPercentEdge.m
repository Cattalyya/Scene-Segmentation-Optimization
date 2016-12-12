function edgeImg = findPercentEdge(imgBW,pc)
    [Gmag,Gdir] = imgradient(imgBW);
    thres = prctile(reshape(Gmag,[1,size(Gmag,1)*size(Gmag,2)]),pc);
    edgeImg = Gmag >= thres;
end