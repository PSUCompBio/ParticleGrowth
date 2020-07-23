function map= materialmap (coordinates)
ncol = 284
material2 = randperm(size(coordinates,2),ncol); %creates random matrix of column locations

for a=1:length(material2)
      coordinates(2*material2(a)-1)
      coordinates(2*material2(a)-0)
end


for d=1:size(coordinates,2)
    colorred = 0;
    % if point is in material2, color red
     for e=1:length(material2)
         if d == material2(e) 
             % point d is a landmark
             colorred = 1;
         end
     end
       if colorred == 0
         figure(7)
         %scatter(coordinates(1,d),coordinates(2,d),'black','filled','d')
     end
     if colorred == 1
         figure(7)
         %scatter(coordinates(1,d),coordinates(2,d),'red','filled','d')
     end
     hold on
end
print('materialmap', '-dpng')
end
