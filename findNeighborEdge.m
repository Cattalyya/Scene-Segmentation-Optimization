function edgeImg = findNeighborEdge(imgBW,k)
roww = size(imgBW,1);
coll = size(imgBW,2);
for i=1:roww
    for j=1:coll
        minr = max(1,i-k);
        maxr = min(roww,i+k);
        minc = max(1,j-k);
        maxc = min(coll,j+k);
        ttl = 0;
        for r = minr:maxr
            for c = minc:maxc
                ttl = ttl + imgBW(r,c);
            end
        end
        ttl = ttl / ((maxr - minr + 1)*(maxc - minc + 1));
        edgeImg(i,j) = imgBW(i,j) >= ttl;
    end
end
end