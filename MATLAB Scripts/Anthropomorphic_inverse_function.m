function [q, reachability] = Anthropomorphic_inverse_function(Endeffector, Elbow_down,Shoulder_left)

%Anthropomorphic arm
a1 = 70; %cm
a2 = 50; %cm
a3 = 50; %cm

%State of the End Effector
PWx = Endeffector(1);
PWy = Endeffector(2);
PWz = Endeffector(3);

%Find c3
c3 = (PWx^2+PWy^2+PWz^2-a2^2-a3^2)/(2*a2*a3);

%implementation of the rechability condition
if (c3>=-1 && c3<=1)
    s3_1 = sqrt(1-c3^2);
    s3_2 = -sqrt(1-c3^2);
   
    %find values of theta3
    theta3_1 = atan2(s3_1, c3);
    theta3_2 = -theta3_1;

    %find the values of theta2 (4 values)
    denominator = a2^2+a3^2+2*a2*a3*c3;
    root = sqrt(PWx^2+PWy^2);

    % Find c2 (4 values)
    c2_1 = (root*(a2+a3*c3)+PWz*a3*s3_1)/(denominator);    %(i)
    c2_2 = (-root*(a2+a3*c3)+PWz*a3*s3_1)/(denominator);   %(ii)
    c2_3 = (root*(a2+a3*c3)+PWz*a3*s3_2)/(denominator);      %(iii)
    c2_4 = (-root*(a2+a3*c3)+PWz*a3*s3_2)/(denominator);     %(iv)

    % Find s2 (4 values)
    s2_1 = (PWz*(a2+a3*c3)-root*a3*s3_1)/(denominator);   %(i)
    s2_2 = (PWz*(a2+a3*c3)+root*a3*s3_1)/(denominator);   %(ii)
    s2_3 = (PWz*(a2+a3*c3)-root*a3*s3_2)/(denominator);     %(iii)
    s2_4 = (PWz*(a2+a3*c3)+root*a3*s3_2)/(denominator);     %(iv)
   
    %finally theta2 (four values)

    theta2_1 = atan2(s2_1, c2_1);
    theta2_2 = atan2(s2_2, c2_2);
    theta2_3 = atan2(s2_3, c2_3);
    theta2_4 = atan2(s2_4, c2_4);

    %find theta 1
    theta1_1 = atan2(PWy, PWx);
    if (PWy>=0)
        theta1_2 = atan2(PWy, PWx) -pi;
    elseif (PWy<0)
        theta1_2 = atan2(PWy, PWx) +pi;
    end

    %Now,
    if (Elbow_down ==1 && Shoulder_left == 0)
       q = [rad2deg(theta1_1), rad2deg(theta2_1), rad2deg(theta3_1)];

    elseif (Elbow_down ==0 && Shoulder_left == 1)
       q = [rad2deg(theta1_1), rad2deg(theta2_3), rad2deg(theta3_2)];

    elseif (Elbow_down ==0 && Shoulder_left == 0)
       q = [rad2deg(theta1_2), rad2deg(theta2_2), rad2deg(theta3_1)];

    elseif (Elbow_down ==1 && Shoulder_left == 1)
        q = [rad2deg(theta1_2), rad2deg(theta2_4), rad2deg(theta3_2)];
    end
    reachability = 1;
else
    q = [0 0 0];
    reachability = 0;

end
end

