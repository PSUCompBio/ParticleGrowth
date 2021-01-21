function plot= colorplots(pixel_labels, IM)
%plots
%plotting Color 1 (all the black)
mask1 = pixel_labels==1;
cluster1 = IM .* uint8(mask1);
%imshow(cluster1);
%title('Objects in Cluster 1');


% %plotting Color 2 (Yellow Cartilage)
mask2 = pixel_labels==2;
cluster2 = IM .* uint8(mask2);
%imshow(cluster2);
%title('Objects in Cluster 2');

%plotting Color 3(Brain Outline)
mask3 = pixel_labels==3;
cluster3 = IM .* uint8(mask3);
%imshow(cluster3)
%title('Objects in Cluster 3');
figure1=figure(1)
montage({cluster1, cluster2, cluster3})
print('segmentedimages', '-dpng')
end
