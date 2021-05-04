%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 'find_PD_gains.m' calculates the set of backstepping gains that 
% corresponds to a given set of PD gains and vice versa.
%
% The equation to solve is: 
%
%       k_1^2 - Kd*k_1 + (Kp-1-Gamma) = 0,
%       k_2   = Kd - k_1,
%       ki    = Gamma*k_1,
%
% To find the PID gains, calculate:
%
%       kp = K_1*K_2 + 1 + Gamma,
%       kd = K_1 + K_2,
%       ki = Gamma*K_1,
%
% The above equations are an approximation that are valid only if:
%
%      k_1*k_2 + 1 >> Ki/k_1,
%
% -------------------------------------------------------------------------
% 1) PD to backstepping:
%
% Inputs:
%   -Kp: proportional gain of the PID control law
%   -Kd: derivative   gain of the PID control law
%   -Gamma:  adaptation gain of the adaptive backstepping control law

% Outputs:
%   -k1:  1st gain of the adaptive backstepping control law
%   -k2:  2nd gain of the adaptive backstepping control law
%   -ki: Integral gain of the PID control law

% -------------------------------------------------------------------------
% 2) backstepping to PD:
%
% Inputs:
%   -K1:  1st gain of the adaptive backstepping control law
%   -K2:  2nd gain of the adaptive backstepping control law
%   -Gamma:  adaptation gain of the adaptive backstepping control law
%
% Outputs:
%   -kp: proportional gain of the PID control law
%   -ki: Integral     gain of the PID control law
%   -kd: derivative   gain of the PID control law
%
% -------------------------------------------------------------------------
% Created by Ahmad Kourani, PhD candidate, February 2020
% Vision and Robotics Lab,
% American University of Beirut.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% To find the backstepping gains for a set of PD gains:
 
Kp = 1;
Kd = 1.1;
Gamma = 0.4;

a = 1;
b = -Kd;
c = Kp - 1 - Gamma;

p  = [a b c];
r  = roots(p);
k_1 = max(r)
k_2 = min(r)
ki = Gamma*k_1
pause()

%% To find the PD gains for a set of backstepping gains:
 
K_1 = 3.7;
K_2 = 0.3;
Gamma = 0.4;

kp = 1 + K_1*K_2 + Gamma
kd = K_1 + K_2
ki = Gamma*K_1

Kp_max = kd^2/4 + 1 + Gamma
Kv_min = 2*sqrt(kp - Gamma - 1)
