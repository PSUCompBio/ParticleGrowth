clc %clear command window everytime code is run

%assign materials
%eventually put in loop dynamically
material=assignmaterial(coordinates)

%pull landmarks not right now
%landmarks=landmarkloop(coordinates) %function that defines landmarks
%plotlandmarks(coordinates, landmarks) %plot

%these values aren't accurate for 3d, but we'll get back to it

e175d= 5.1; %used very rough estimates from images for now
e155d= 4;
nsteps = 50; 
expansion_growth_ratio = e175d/e155d;
lambda=[0 0 0; 0 0 0; 0 0 0];
Dlambda=[1 0 0; 0 1 0; 0 0 1]*expansion_growth_ratio/nsteps; %gives radial expansion
 
originalplotvtu(coordinates, material)

for g=0:1
lambdanew=lambda+Dlambda;
lambda=lambdanew;
added=makemat(coordinates)
coordinates=addmat(coordinates, added)
material=assignmaterial(coordinates);
    for h=1:size(coordinates,2)
        if material(h) == 1 %could do materials instead, if it equals 1, deforming the brain right now
            z=.1;
            local_lambda = lambdanew*z;
        else
            if material(h)==2
            z=.5;
            local_lamba= lambdanew*z
            else
            local_lambda = lambdanew;
            end
        end
        Fgrowth=[1+ local_lambda(1,1) 0 0; 0 1 + local_lambda(2,2) 0; 0 0 1+local_lambda(3,3)];
        %n is tip to tail from particle to center--what does that even
        %mean? A vector? like computing the distances from the center?
        %n=pdist(coordinates, 'euclidian')
        Fmechanics=[1 0 0 ; 0 1 0; 0 0 1]; %F as matrix with lambda
        Ftotal=Fgrowth * Fmechanics;

    end
    if g==1%if step is 1, 5, or 10
        deformedplotvtu(Ftotal, coordinates, material, g); %write this file
    end
end

%||g==5||g==10||g==15||g==20||g==25||g==30||g==35||g==40||g==45||g==50 
