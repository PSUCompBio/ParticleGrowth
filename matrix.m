x=[1 0 0]
y=[1 0 0]
f1= x'*y

x2=[0 1 0]
y2=[0 1 0]
f2=x2'*y2

x3= [0 0 1]
y3= [0 0 1]
f3= x3'*y3

%what we currently have
%Fgrowth=[1+ local_lambda(1,1) 0 0; 0 1 + local_lambda(2,2) 0; 0 0 1+local_lambda(3,3)];
%Fmechanics=[1 0 0 ; 0 1 0; 0 0 1]; %F as matrix with lambda
%Ftotal=Fgrowth * Fmechanics;

%is only different fgrowth*fmechanics'?

%kroenecker
%kron=kron(x,y)