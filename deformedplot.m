function plot=deformedplot(coordinates, landmarks, displacement)
for k=1:size(coordinates,2)
    colorred = 0;
    % if point is in landmarks, color red
    for l=1:length(landmarks)
        if k == landmarks(l)
            % point i is a landmark
            colorred = 1;
        end
    end
    if colorred == 0
        figure(8)
        scatter(coordinates(1,k) + displacement(1,k), coordinates(1,k) + displacement(1,k), 'black') %scatter deformed point
    end
    if colorred == 1
        figure (8)
        scatter(coordinates(1,k) +displacement(1,k), coordinates(2,k) + displacement(2,k), 'red', 'filled') %scatter deformed points
    end
    hold on
    for n=1:length(landmarks)
        if colorred==1
            plotcircle(coordinates(1,k), coordinates(2,k),r)
            hold on
            plotcircle(coordinates(1,k)+displacement(1,k), coordinates(2,k) +displacement(2,k), r)
        end
    end
    print('deformed', '-dpng')
end