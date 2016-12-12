function newPredImg = regroup(predImg, edgeImg)
newPredImg = predImg;
[L,num] = bwlabel(ones(size(edgeImg)) - edgeImg,4); % reverse 0s & 1s
for i=1:num
    pixels = find(L == i);
    colors = predImg(pixels);
    colorsNotZero = colors(colors ~= 0); % remove 0's
    if(~isempty(colorsNotZero))
        color = mode(colorsNotZero);
    else
        color = 0;
    end
    newPredImg(pixels) = color;
end
end