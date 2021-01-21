function plot=deformedplotvtu(Ftotal, coordinates, material, g)
displacement= (Ftotal * coordinates) - coordinates; 
deformedcoordinates=[coordinates(1,:)+displacement(1,:); coordinates(2,:)+displacement(2,:); coordinates(3,:)+displacement(3,:)]
connectivity=[(1:length(coordinates))-1]
offset=[(1:length(coordinates))*0+1]
types= [(deformedcoordinates(1,:)*0)+2]
name='Deformed_Plot_%d.vtu';
iteration=g
string=sprintf(name,iteration)
deformedfile=fopen(string, 'w')
fprintf(deformedfile, '<?xml version="1.0"?>\n')
fprintf(deformedfile, '<VTKFile type="UnstructuredGrid" version="0.1" byte_order="LittleEndian">\n')
fprintf(deformedfile, '\t<UnstructuredGrid>\n')
fprintf(deformedfile, '\t\t<Piece NumberOfPoints="%d" NumberOfCells="1">\n',length(coordinates))
fprintf(deformedfile, '\t\t\t<Points>\n')
fprintf(deformedfile, '\t\t\t\t<DataArray type="Float64" NumberOfComponents="3" format="ascii">\n')
fprintf(deformedfile, '\t\t\t\t\t%5.6e %5.6e %d\n', deformedcoordinates)
fprintf(deformedfile, '\t\t\t\t</DataArray>\n')
fprintf(deformedfile, '\t\t\t</Points>\n')
fprintf(deformedfile, '\t\t\t <Cells>\n') 
fprintf(deformedfile, '\t\t\t\t<DataArray type="Int32" Name="connectivity" format="ascii">\n')
fprintf(deformedfile, '\t\t\t\t\t%d\n', connectivity)
fprintf(deformedfile, '\t\t\t\t</DataArray>\n')
fprintf(deformedfile, '\t\t\t\t<DataArray type="Int32" Name="offsets" format="ascii">\n')
fprintf(deformedfile, '\t\t\t\t\t %d\n', length(coordinates))
fprintf(deformedfile, '\t\t\t\t</DataArray>\n')
fprintf(deformedfile, '\t\t\t\t<DataArray type="Int32" Name="types" format="ascii">\n')
fprintf(deformedfile, '\t\t\t\t\t 2\n')
fprintf(deformedfile, '\t\t\t\t</DataArray>\n')
fprintf(deformedfile, '\t\t\t</Cells>\n')
fprintf(deformedfile, '\t\t\t <PointData>\n') 
% fprintf(deformedfile, '\t\t\t\t<DataArray type="Int32" Name="landmarks" NumberofComponents="1" format="ascii">\n')
% for h=1:size(landmarks,1)
%       fprintf(deformedfile, '\t\t\t\t\t%d\n', landmarks(h))  
% end
% fprintf(deformedfile, '\t\t\t\t</DataArray>\n')
fprintf(deformedfile, '\t\t\t\t<DataArray type="Int32" Name="materials" NumberofComponents="1" format="ascii">\n')
for h=1:size(material,1)
      fprintf(deformedfile, '\t\t\t\t\t%d\n', material(h))  
end
fprintf(deformedfile, '\t\t\t\t</DataArray>\n')
fprintf(deformedfile, '\t\t\t\t<DataArray type="Int32" Name="geneexpression" NumberofComponents="1" format="ascii">\n')
for h=1:size(material,1)
      fprintf(deformedfile, '\t\t\t\t\t%d\n', material(h))  
end
fprintf(deformedfile, '\t\t\t\t</DataArray>\n')
fprintf(deformedfile, '\t\t\t</PointData>\n')
fprintf(deformedfile, '\t\t</Piece>\n')
fprintf(deformedfile, '\t</UnstructuredGrid>\n')
fprintf(deformedfile, '</VTKFile>\n')
fclose('all')
end