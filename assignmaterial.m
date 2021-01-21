function material= assignmaterial(coordinates)
r=100
inner=50
brainpoints=find(sqrt(coordinates(1,:).^2+coordinates(2,:).^2+coordinates(3,:).^2)<=r);
brainpointsinner=find(sqrt(coordinates(1,:).^2+coordinates(2,:).^2+coordinates(3,:).^2)<=inner);
material=zeros(size(coordinates,2),1); %start by setting all 0
material(brainpoints)=1%if the index is in the brain points, set brain to 1, while skull is 0
material(brainpointsinner)=2%if the index is in the brain points, set brain to 1, while skull is 0
end
