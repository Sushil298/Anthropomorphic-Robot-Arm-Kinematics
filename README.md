# Introduction  

This repository presents the Simulink implementation of forward and inverse kinematics for a 3-link anthropomorphic robot arm. By utilizing these kinematics, the robot arm can trace a defined path, with the gripper's position specified in x, y, and z coordinates relative to a world frame, and its orientation determined by angles θ1, θ2, and θ3 from its initial state. The pose of the arm is depicted below.  

<img width="465" alt="Screen Shot 2023-10-29 at 7 15 01 PM" src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/17edf573-6c89-4c84-9136-b5666b5b70c9">  

The initial state of the arm is:  

<img width="460" alt="Screen Shot 2023-10-29 at 7 24 12 PM" src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/45f4e586-384a-41bd-81ef-8e761a572acf">


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
### 1. Create a matlab function that would compute forward kinematics of the manipulator
a) Input: joints’ states  
b) Output: Points needed to draw the manipulator (as in forward kinematics lab)  
### 2. Create a matlab function that would compute inverse kinematics of the manipulator  
a) Input: end-effector x,y,z, orientation and elbow up/down boolean  
b) Output: joints’ states  

### 3. Create a matlab live script that does the following:  
a) Has 3 sliders that allow user to input x,y,phi of the end-effector  
b) Has a check box for elbow up/down configuration  
c) Calls the inverse kinematics function  
d) Calls the forward kinematics function  
e) Draws the manipulator in the desired configuration and displays joints’ states     
in the title of the plot  
4. Implement reachability check  
5. Create a Simscape model with the same functionality (for inputs use dashboard
blocks)  

### 7. Create a path for the manipulator such that:  
a) The path will be a straight line along x-axis (WCF)  
b) x,y,z and time vectors are needed  
c) Use To/From Workspace blocks to apply inputs and save joint states  
8. Make sure the path is displayed in Mechanical Explorer (Spline block)  

# Path Planning  
The gripper is following the line on the Floor with both Elbow up and down configurations. 

<p float="left">
  <img src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/76004d07-70ee-402a-8a34-7fa8fe5f0412" alt="Elbow_Down" width="450" />
  <img src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/d7db8b8d-ba36-4379-a09e-016f51423a8a" alt="Elbow_Up" width="450" /> 
</p>

Now, theta1 and theta2 are fixed to 45 degrees and theta1 changes from 0 to 360 degrees.  

<p float="left">
  <img src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/961ca3ef-5f73-49f5-96ca-e237c52cc4f9" alt="45degrees" width="450" />
</p>

# Test Cases  

## Test Cases in Simulink   

<img width="1000" alt="Screen Shot 2023-10-29 at 8 07 43 PM" src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/1e8f11b4-5b65-4a24-bc1b-3e83663848ae">
<img width="1000" alt="Screen Shot 2023-10-29 at 8 09 46 PM" src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/04c899b7-6faf-45b9-bf6e-36a76e9d7395">


## Test Cases in Plots  

<img width="1000" alt="Screen Shot 2023-10-29 at 8 06 50 PM" src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/da0fb600-495a-49a5-8e35-1683ade84c0f">
<img width="1000" alt="Screen Shot 2023-10-29 at 8 07 25 PM" src="https://github.com/Sushil298/Anthropomorphic-Robot-Arm-Kinematics/assets/80779647/9e8b09c1-0c72-4a2a-bec5-37fb38ab24ce">  

