function finalcoords=center(xpoints, ypoints, zpoints)

%averages
xaverage=mean(xpoints);
yaverage=mean(ypoints);
zaverage=mean(zpoints);

 
%center the points

XMax=max(xaverage);
XMin=min(xaverage);
Xfactor=(XMax-XMin)/2;
Xscale=XMin+Xfactor;

YMax=max(yaverage);
YMin=min(yaverage);
Yfactor=(YMax-YMin)/2;
Yscale=YMin+Yfactor;


ZMax=max(zaverage);
ZMin=min(zaverage);
Zfactor=(ZMax-ZMin)/2;
Zscale=ZMin+Zfactor;
 
%coordinates to deform 
finalcoords=[xaverage-Xscale; yaverage-Yscale; zaverage-Zscale];



