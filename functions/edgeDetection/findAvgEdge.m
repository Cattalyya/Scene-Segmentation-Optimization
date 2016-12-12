function edgeImg = findAvgEdge(imgBW)
[Gmag,Gdir] = imgradient(imgBW);
avg = mean(mean(Gmag));
edgeImg = Gmag >= avg;
end