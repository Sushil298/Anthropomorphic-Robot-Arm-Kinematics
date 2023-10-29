function [base, Joint1, Joint2, Endeff] = Anthropomorphic_forward_function(q)
%Anthropomorphic arm
l1 = 70; %cm
l2 = 50; %cm
l3 = 50; %cm

a = [0 l2 l3];

% the angles are in degree
theta1 = q(1);
theta2 = q(2); 
theta3 = q(3);

theta = [theta1, theta2, theta3];

%transformation matrix for frame 3

A_3to2 = [cosd(theta(3)) -sind(theta(3)) 0 a(3)*cosd(theta(3))
          sind(theta(3)) cosd(theta(3))  0 a(3)*sind(theta(3))
          0                 0            1        0
          0                 0            0        1];

%transformation matrix for frame 2

A_2to1 = [cosd(theta(2)) -sind(theta(2)) 0 a(2)*cosd(theta(2))
          sind(theta(2)) cosd(theta(2))  0 a(2)*sind(theta(2))
          0                 0            1        0
          0                 0            0        1];

%transformation matrix for frame 1

A_1to0 = [cosd(theta(1))    0    sind(theta(1))   0
          sind(theta(1))    0    -cosd(theta(1))  0
          0                 1            0        0
          0                 0            0        1];
%Total trnsformation matrix 
A_3to0 = A_1to0*(A_2to1*A_3to2);

%Point on the floor wrt to frame 0
base = [0;  0; -l1];
% Joint 1 wrt to frame 1
Joint1 = [0;  0; 0];
% Joint 2 wrt to frame 2
Joint2 = [0; 0; 0];
%End effector wrt to frame 3
Endeff = [0; 0; 0];

%transformation of end effector
Endeff = A_3to0 *[Endeff; 1];

%Transformation of Joint 2
Joint2= (A_1to0*A_2to1)*[Joint2; 1];

%Transformation of Joint 1
Joint1 = A_1to0*[Joint1; 1];

%The coordinates of the joints wrt to frame 0
base = base(1:3);
Joint1 = Joint1(1:3);
Joint2 = Joint2(1:3);
Endeff = Endeff(1:3);
end

