function edgeImg = findNeighborEdge(imgBW,k)
[Gmag,Gdir] = imgradient(imgBW);
roww = size(Gmag,1);
coll = size(Gmag,2);
for i=1:roww
    for j=1:coll
        minr = max(1,i-k);
        maxr = min(roww,i+k);
        minc = max(1,j-k);
        maxc = min(coll,j+k);
        ttl = 0;
        for r = minr:maxr
            for c = minc:maxc
                ttl = ttl + Gmag(r,c);
            end
        end
        ttl = ttl / ((maxr - minr + 1)*(maxc - minc + 1));
        edgeImg(i,j) = Gmag(i,j) >= ttl;
    end
end
end