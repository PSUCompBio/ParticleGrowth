function finalcoords=center(xpoints, ypoints)

%averages
xaverage=mean(xpoints);
yaverage=mean(ypoints);
 
%center the points

XMax=max(xaverage)
XMin=min(xaverage)
Xfactor=(XMax-XMin)/2
Xscale=XMin+Xfactor

YMax=max(yaverage)
YMin=min(yaverage)
Yfactor=(YMax-YMin)/2
Yscale=YMin+Yfactor

 
%coordinates to deform 
finalcoords=[xaverage-Xscale; yaverage-Yscale];



