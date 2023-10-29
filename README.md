# BackGround Information
Forward kinematics (FK) is the mapping from joint coordinates, or robot configuration,
to end-effector pose. In other words, the main purpose of FK is to answer the following
question: Given the joint states, what is the position and orientation of the end-effector?  

Inverse Kinematics (IK) does the opposite. It answers the question: What the joint states
should be to achieve a desired position and orientation of the end-effector? IK of simple
manipulators can be derived with help of geometry. The figure below illustrates the
relationship between Forward and Inverse Kinematics.  
<img width="465" alt="Screen Shot 2023-10-29 at 6 55 12 PM" src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/1e04a0df-71a2-459c-82cc-77fb3c871fe9">

# Project Goals
## 1. Create a matlab function that would compute forward kinematics of the manipulator
a) Input: joints’ states  
b) Output: Points needed to draw the manipulator (as in forward kinematics lab)  
# 2. Create a matlab function that would compute inverse kinematics of the manipulator  
a) Input: end-effector x,y,z, orientation and elbow up/down boolean  
b) Output: joints’ states  

# 3. Create a matlab live script that does the following:  
a) Has 3 sliders that allow user to input x,y,phi of the end-effector  
b) Has a check box for elbow up/down configuration  
c) Calls the inverse kinematics function  
d) Calls the forward kinematics function  
e) Draws the manipulator in the desired configuration and displays joints’ states     
in the title of the plot  
4. Implement reachability check  
5. Create a Simscape model with the same functionality (for inputs use dashboard
blocks)  

# 7. Create a path for the manipulator such that:  
a) The path will be a straight line along x-axis (WCF)  
b) x,y,z and time vectors are needed  
c) Use To/From Workspace blocks to apply inputs and save joint states  
8. Make sure the path is displayed in Mechanical Explorer (Spline block)  
