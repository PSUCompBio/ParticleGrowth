% old work to color segment image slices
% 
% IM=imread('mouse test.png'); %read image
% pixel_labels=colorsegment(IM) %segment
% colorplots(pixel_labels, IM) %make color segmented plots
% [rows cols]=find(pixel_labels==3); %extract blue
% boundary1=boundary(rows, cols); %extract blue boundary
% 
% %mesh formation-stl file
% p = [rows(boundary1), cols(boundary1)];
% dt = delaunayTriangulation(p(:,1),p(:,2));
% ic = incenter(dt) ;
% tr = triangulation(dt.ConnectivityList, dt.Points);
% stlwrite(tr, 'try.stl')

%mesh making
model=createpde; %make pdea model
%importGeometry(model, 'try.stl'); %import stl
importGeometry(model, '3d_model_of_Sphere.stl'); %import stl
ndim=3; %set up ndim variable
mesh_default=generateMesh(model);
% figure (3)
% if ndim==2 %if 2D plot this way
%     q=pdeplot(mesh_default,'ElementLabels','off');
% else
%     ndim==3 %if 3D plot this way
%     q=pdeplot3D(mesh_default,'ElementLabels','off');
% end

%pull out points from mesh
meshelements=[mesh_default.Elements]';
for i=1:length(meshelements);
    if ndim==2;
        nodes=meshelements(:,1:3)'; %pulls the node numbers that make up that element
        points=mesh_default.Nodes(1:2,nodes); %each node has coordinates, this pulls the x,y
        else
        ndim==3;
        nodes=meshelements(:,1:4)';
        points=mesh_default.Nodes(1:3,nodes); %pulls the x y and z coords of each node
    end
end

xpoints=points(1,:);
if ndim==2;
    xpoints=reshape(xpoints,[3,length(nodes)]); %each column is the x points of element
    else ndim==3;
    xpoints=reshape(xpoints,[4,length(nodes)]); %each column is x points of the 3d element
end
ypoints=points(2,:);
if ndim==2;
    ypoints=reshape(ypoints,[3,length(nodes)]); %each column is the x points of element
    else ndim==3;
    ypoints=reshape(ypoints,[4,length(nodes)]); %each column is x points of the 3d element
end
if ndim==2;
    zpoints=points(2,:);
    zpoints=reshape(zpoints,[3,length(nodes)]); %each column is the x points of element
else ndim==3;
 zpoints=points(3,:);
 zpoints=reshape(zpoints,[4,length(nodes)]); %each column is x points of the 3d element
end

%average and center points to establish coordinates
coordinates=center(xpoints, ypoints, zpoints);

%second layer work, but don't think it's needed
% ncoordinates=[coordinates,coordinates];
% ncoordinates(3,length(coordinates):length(ncoordinates))=5;
% coordinates=[]
% coordinates=ncoordinates
