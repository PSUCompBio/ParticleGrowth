clc %clear command window everytime code is run
IM=imread('mouse test.png'); %read image
pixel_labels=colorsegment(IM) %segment

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
figure(1)
montage({cluster1, cluster2, cluster3})
print('segmentedimages', '-dpng')
 
[rows cols]=find(pixel_labels==3); %extract blue
boundary1=boundary(rows, cols); %extract blue boundary

%mesh formation-stl file
p = [rows(boundary1), cols(boundary1)];
%plot(p(:,1),p(:,2))
dt = delaunayTriangulation(p(:,1),p(:,2));
ic = incenter(dt) ;
tr = triangulation(dt.ConnectivityList, dt.Points);
%figure(2)
%triplot(tr)
%hold on
%plot(ic(:,1),ic(:,2),'*r')
stlwrite(tr, 'try.stl')


%make mesh
model=createpde;
importGeometry(model, 'try.stl');
mesh_default=generateMesh(model);
figure (3)
q=pdeplot(mesh_default,'ElementLabels','on')
set(q,'color','red');



meshelements=[mesh_default.Elements]';
 
for i=1:length(meshelements)
     nodes=meshelements(:,1:3)';
     points=mesh_default.Nodes(1:2,nodes); 
end
 

xpoints=points(1,:);
xpoints=reshape(xpoints,[3,567]); %each column is x points of triangle
ypoints=points(2,:);
ypoints=reshape(ypoints,[3,567]); %each column is y points of triangle

coordinates=center(xpoints, ypoints) %center points

landmarkloop(coordinates) %function that does everything pulling landmarks and plotting

% materialmap(coordinates)
% 
 deformandplot(coordinates)
