% test
IM=imread('pixel.png') %readimage


%color based segmentation
%adapted from https://www.mathworks.com/help/images/color-based-segmentation-using-k-means-clustering.html
%this function converts sRGB values to CIE 1976 L*a*b* values
lab_image=rgb2lab(IM); %turn it into the color segmentation
%this function indicates it's a lab image and defines clusters
ab= lab_image(:,:,2:3);
%this reduces the clusters in a and b space
ab= im2single(ab);
nColors=3; %3 colors in image
pixel_labels=imsegkmeans(ab, nColors, 'NumAttempts',3); %segment by number of colors to reduce
figure(1);
imshow(pixel_labels,[]) %show image of 3 colors segmented

% %plotting Color 1 (all the black)
mask1 = pixel_labels==1;
cluster1 = IM .* uint8(mask1);
%figure(2);
%imshow(cluster1);
%title('Objects in Cluster 1');
% % 
% % 
% % %plotting Color 2 (Yellow Cartilage)
% % 
mask2 = pixel_labels==2;
cluster2 = IM .* uint8(mask2);
% figure(3);
% imshow(cluster2);
% title('Objects in Cluster 2');
% 
% %plotting Color 3(Brain Outline)
% 
mask3 = pixel_labels==3;
cluster3 = IM .* uint8(mask3);
% figure(4)
% imshow(cluster3)
% title('Objects in Cluster 3');
% 

[rows, cols]=find(pixel_labels==2)
scatter(rows, cols)


% 
% %extract colors
% %messy from image 
% %and it's filled
% [rows,cols]=find(cluster3==145)
% plot(rows, cols)
% boundary1=boundary(rows, cols)
% figure (5)
% plot(rows(boundary1), cols(boundary1))
