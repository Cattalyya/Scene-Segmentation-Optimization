function grayLab = dataEncode(colorLab, colorcode)
%% This function encodes rgb images into label maps for experiment usage
% grayLab: [h, w]
% colorcode: [n, 3] where n is the number of classes
% rgbLab: [h, w, 3]

[h, w, ch] = size(colorLab);
grayLab = zeros(h, w, 'uint8');

for i = 1:150
    if i==0   continue;   end
    rgbColor = colorcode(i,:);
    grayLab = grayLab + bsxfun(@times, uint8(colorLab(:,:,1)==rgbColor(1) & colorLab(:,:,2)==rgbColor(2) & colorLab(:,:,3)==rgbColor(3)), i);
end
