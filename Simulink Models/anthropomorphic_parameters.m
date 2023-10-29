clear all;
clc

rho = 1000;
l1 = 0.70;  %meter
l2 = 0.50;  %meter
l3= 0.50;   %meter


%Floor
floor.surf.w= 0.6;    % 1
floor.surf.l= 2;    %1
floor.surf.h= 0.01;
floor.surf.rgb = [0.5 0.5 0.5];
floor.surf.rho = rho;

%cylinder on the first joint 
floor.cyl1.r = 5.9*0.0254/2;
floor.cyl1.h = 9.2*0.0254;
floor.cyl1.rgb = [1 0 0];
floor.cyl1.rho = rho;

% The base cylinder (link1)
floor.link1.r = 4*0.0254/2;
floor.link1.h = l1;
floor.link1.rgb = [0.1 0.1 0.06];
floor.link1.rho = rho;


% First joint
link2.joint.r = 5.9*0.0254/2;
link2.joint.h = 9.2*0.0254;
link2.joint.rgb = [1 0 0];
link2.joint.rho = rho;

%link 2 cylinder 
link2.cyl0.r = 4*0.0254/2;
link2.cyl0.h = l2;
link2.cyl0.rgb = [0.1 0.1 0.06];
link2.cyl0.rho = rho;

% second joint
link3.joint.r = 5.9*0.0254/2;
link3.joint.h = 9.2*0.0254;
link3.joint.rgb = [1 0 0];
link3.joint.rho = rho;

% link 3
link3.cyl0.r = 4*0.0254/2;
link3.cyl0.h = l3;
link3.cyl0.rgb = [0.1 0.1 0.06];
link3.cyl0.rho = rho;

%Gripper --------------------------------------------------
% Gripper base
gripper.brick0.l = 0.05;
gripper.brick0.w = 0.1;
gripper.brick0.h = 0.35;
gripper.brick0.rgb = [1 0 0];
gripper.brick0.rho = rho;


% Gripper side 2
gripper.brick1.l = 0.1;
gripper.brick1.w = 0.1;
gripper.brick1.h = 0.35/10;
gripper.brick1.rgb = [1 0 0];
gripper.brick1.rho = rho;

% Gripper Side 2

gripper.brick2.l = 0.1;
gripper.brick2.w = 0.1;
gripper.brick2.h = 0.35/10;
gripper.brick2.rgb = [1 0 0];
gripper.brick2.rho = rho;

%---------------------------------------------------------------------
%creating the path for the manipulator
left_max = -71.41428;
right_max = 71.41428;
sampleTime = 0.040;                % step time
numSteps = 150;                     % number of steps
time = sampleTime*(0:numSteps-1);  
time = time';                      %time column vector

x =linspace(left_max,right_max,numSteps)';
y = (zeros(1, numSteps))';
z = (-70 + zeros(1, numSteps))';         %-70 cm
simin = [time,x,y,z];

%-------------------------------------------------------------------
%changing q1 keeping q2 and q3 to be 45 degrees

new_steps = 200;
new_time = sampleTime*(0:new_steps-1);
new_time=new_time';
theta_1_in = linspace(0,360,new_steps)';
q_simin = [new_time,theta_1_in];



