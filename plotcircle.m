function circle=plotcircle(x1,y1,r)
theta = 0:0.05:2*pi;
hold on;
circle=plot(x1+r*cos(theta),y1+r*sin(theta));
