 clc %clear command window everytime code is run
% Create a random set of coordinates in a circle.
% First define parameters that define the number of points and the circle.
n = 100; %number of points
R = 2; %radius
x0 = 0; % Center of the circle in the x direction.
y0 = 0; % Center of the circle in the y direction.
% Now create the set of points.
t = 2*pi*rand(n,1);
r = R*sqrt(rand(n,1));
x = x0 + r.*cos(t);
y = y0 + r.*sin(t);
% Now display our random set of points in a figure.
figure(1)
plot(x,y, '.', 'MarkerSize', 12)
hold on
%add circle outline
xcenter= 0;
ycenter= 0;
radius=2;
th=0:pi/50:2*pi;
xunit= radius*cos(th) +xcenter;
yunit = radius * sin(th) + ycenter;
plot(xunit, yunit)
axis equal;
grid on;
fontSize = 15;
xlabel('X', 'FontSize', fontSize);
ylabel('Y', 'FontSize', fontSize);
title('Random Locations Within a Circle', 'FontSize', fontSize);


na=8;
tet=linspace(-pi,pi,na+1);
xi=r*cos(tet)+x0;
yi=r*sin(tet)+y0;
for k=1:numel(xi);
plot([x0 xi(k)],[y0 yi(k)]);
hold on
end

 
X= [x  y]' %making matrix to deform
landmarks =[ 2 4 6 8 ];
%X(2*landmarks(1)-1)
%X(2*landmarks(1)+0)
for i=1:length(landmarks)
    X(2*landmarks(i)-1);
    X(2*landmarks(i)-0);
end

%want to divide up into different subsections based on location in the
%circle then apply different F to them

%first attempt
%t=0
%lambda1=[1 0; 0 1]; %setting lambda as 1, semi colon to not show up in command
% x1= X * lambda1;
%t>0
% lambda2=[1.1 0; 0 1.1]; %setting lambda 2 as 1.1
% x2= X * lambda2; %creating deformed coordinates with lambda 1.1 
p0d= 3.9;
e17p5= 3.4;
nsteps = 10;
expansion_growth_ratio = p0d/e17p5;
Dlambda= expansion_growth_ratio/nsteps;
lambda=0;
figure(1)%plot figures 2-11 (figure 1 is original)
sz=25 ;%small original points
szz=50 ;%big deformed points
for i=1:n 
    colorred = 0;
    % if point is in landmarks, color red
     for j=1:length(landmarks)
         if i == landmarks(j) 
             % point i is a landmark
             colorred = 1;
         end
     end
     if colorred == 0
         scatter(X(1,i),X(2,i),sz,'black','filled','d')
     end
     if colorred == 1
         scatter(X(1,i),X(2,i),sz,'red','filled','d')
     end
     hold on
end

for c=1:nsteps %loop for 10 steps
    lambda=lambda+Dlambda; %setting lamba at steps greater than 1
    
    for i= 1:n 
        landmark_flag = 0;
        % if point is in landmarks, scale lambda
        for j=1:length(landmarks)
            if i == landmarks(j) 
               % point i is a landmark
                landmark_flag = 1;
            end
        end
        if landmark_flag == 1
            local_lambda = lambda*.1;
        else 
            local_lambda = lambda;
        end
         
        Fgrowth=[1+ local_lambda 0; 0 1 + local_lambda];
        Fmechanics=[1 0; 0 1]; %F as matrix with lambda
        Ftotal=Fgrowth * Fmechanics;
        output(:,i)= Ftotal * X(:,i); %deform original points with F when lambda is value
       % i
       % X(:,i)
    end
    
    
%     lambda=lambda+Dlambda; %setting lamba at steps greater than 1
%     Fgrowth=[1+ lambda 0; 0 1 + lambda];
%     Fmechanics=[1 0; 0 1]; %F as matrix with lambda
%     Ftotal=Fgrowth * Fmechanics;
%     output= Ftotal * X; %deform original points with F when lambda is value
   
    for i=1:n 
        colorred = 0;
        % if point is in landmarks, color red
         for j=1:length(landmarks)
             if i == landmarks(j) 
                 % point i is a landmark
                 colorred = 1;
             end
         end
         if colorred == 0
            scatter(output(1,i), output(2,i), szz, 'black', 'filled') %scatter deformed points
         end
         if colorred == 1
             scatter(output(1,i), output(2,i), szz, 'red', 'filled') %scatter deformed points
         end
         hold on
    end
   
end

