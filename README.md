# Tune-Backstepping-Like-PID
Some MATLAB scripts that show the similarity between the backstepping and the PID gains, and help tune a backstepping control law in a similar way to PID tuning.

(to repository is under construction)

# Methodology
The backstepping nonlinear control design for second-order can be formulated as a PID-Feedback + Feedforward tems. The PID gains are related to the backstepping gains through the following relation:

kp = 1 + k1 x k2, <br />
kd = k1 + k2, <br />
ki = gamma k1. <br /> 

(to be updated soon)

<p align="center">
  <img src="https://github.com/KouraniMEKA/Primitive-ML-UAV/blob/main/media/Tethered-UAV-Buoy.JPG" width="653" height="333" >
  <br />
  Planar model of a quadrotor UAV pulling a floating buoy through a tether [1].
</p>


# Prerequisites
MATLAB/Simulink software v2018a or higher.

# How to use
1. ... <br />
2. ... <br />


# Authors
* **Ahmad Kourani** - *initial work* - [KouraniMEKA](https://github.com/KouraniMEKA).
* **Naseem Daher**

# References
[1] A. Kourani and N. Daher, "Leveraging PID Gain Selection Towards Adaptive Backstepping Control for a Class of Second-Order Systems", _ACC_, 2021. (accepted). [link](https://www.researchgate.net/publication/350621101_Leveraging_PID_Gain_Selection_Towards_Adaptive_Backstepping_Control_for_a_Class_of_Second-Order_Systems)

# License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/LICENSE) file for details.
 

