function edgeImg = findAvgEdge(imgBW)
[Gmag,Gdir] = imgradient(imgBW);
avg = mean(mean(imgBW));
edgeImg = Gmag >= avg;
end