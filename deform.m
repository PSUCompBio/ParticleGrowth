function displacement=deform(landmarks, coordinates)
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
    displacement(:,h)
end