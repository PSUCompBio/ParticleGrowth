function loop= landmarkloop (coordinates)
landmarks =[ 191 141 163 167 ]; %setting up framework to pull landmarks
for b=1:length(landmarks)
      coordinates(2*landmarks(b)-1)
      coordinates(2*landmarks(b)-0)
end
for c=1:size(coordinates,2)
    colorred = 0;
    % if point is in landmarks, color red
     for j=1:length(landmarks)
         if c == landmarks(j) 
             % point i is a landmark
             colorred = 1;
         end
     end
       if colorred == 0
         figure(6)
         %scatter(coordinates(1,c),coordinates(2,c),'black','filled','d')
     end
     if colorred == 1
        figure(6)
         scatter(coordinates(1,c),coordinates(2,c),'red','filled','d')
         hold on
     end
         for m=1:length(landmarks)
             if colorred==1
                 r=30
             plotcircle(coordinates(1,c), coordinates(2,c),r) 
             end
         end
     hold on
end
print('originallandmarks', '-dpng')
end