function pixel_labels = colorsegment(IM)

%color based segmentation
%adapted from https://www.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html
%this function converts sRGB values to CIE 1976 L*a*b* values
lab_image=rgb2lab(IM); %turn it into the color segmentation
ab= lab_image(:,:,2:3);
%this reduces the clusters in a and b space
ab= im2single(ab);
nColors=3; %3 colors in image
pixel_labels=imsegkmeans(ab, nColors, 'NumAttempts',3); %segment by number of colors to reduce

