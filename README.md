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
  <img src="https://github.com/KouraniMEKA/Tune-Backstepping-Like-PID/blob/main/figures/k12_from_kpd.JPG" width="640" height="360" >
  <br />
  Coupled k_1 and k_2 for specific k_P and k_D values: (a) at constant k_D and (b) at constant k P . The red and the green regions represent the sets
of all feasible k_1 and k_2 combinations respectively. [1] [link](https://www.researchgate.net/publication/350621101_Leveraging_PID_Gain_Selection_Towards_Adaptive_Backstepping_Control_for_a_Class_of_Second-Order_Systems).
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
[1] [A. Kourani and N. Daher, "Leveraging PID Gain Selection Towards Adaptive Backstepping Control for a Class of Second-Order Systems", _ACC_, 2021. (accepted).](https://www.researchgate.net/publication/350621101_Leveraging_PID_Gain_Selection_Towards_Adaptive_Backstepping_Control_for_a_Class_of_Second-Order_Systems)

# License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/LICENSE) file for details.
 

