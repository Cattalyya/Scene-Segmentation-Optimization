function edgeImg = findAvgEdge(imgBW,k)
[Gmag,Gdir] = imgradient(imgBW);
avg = mean(mean(Gmag));
avg
edgeImg = Gmag >= avg/k;
end