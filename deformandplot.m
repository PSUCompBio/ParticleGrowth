function deform=deformandplot(coordinates)
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
e175d= 5.1; %used very rough estimates from images for now
e155d= 4;
nsteps = 1; 
expansion_growth_ratio = e175d/e155d;
Dlambda= [expansion_growth_ratio/nsteps expansion_growth_ratio/nsteps; expansion_growth_ratio/nsteps expansion_growth_ratio/nsteps]
lambda=[0 0; 0 0];
for g=0:nsteps
    lambdanew=[0 0; 0 0];
    g
     if g>0
        lambdanew=lambda+Dlambda
     end
    for h=1:size(coordinates,2)
        landmark_flag = 0;
        %         %if point is in landmarks, scale lambda
        for i=1:length(landmarks)
            if  h== landmarks(i)
                %                %point h is a landmark
                landmark_flag = 1;
            end
        end
        if landmark_flag == 1
            z=.1;
            local_lambda = lambdanew*z;
        else
            local_lambda = lambdanew;
        end
        Fgrowth=[1+ local_lambda(1,1) 0; 0 1 + local_lambda(2,2)];
        Fmechanics=[1 0; 0 1]; %F as matrix with lambda
        Ftotal=Fgrowth * Fmechanics;
        displacement(:,h)= (Ftotal * coordinates(:,h)) - coordinates(:,h); %deform original points with F when lambda is value
        
    end
    %plot the step
    %write a plot, insert code, function?
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
            %scatter(coordinates(1,k) + displacement(1,k), coordinates(2,k) + displacement(2,k), 'black') %scatter deformed point
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
    end
end
print('deformed', '-dpng')
end