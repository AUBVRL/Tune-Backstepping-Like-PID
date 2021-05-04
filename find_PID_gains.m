%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 'find_PID_gains.m' calculates the set of backstepping gains that 
% corresponds to a given set of PID gains and vice versa.
%
% The equation to solve is: 
%
%       k_1^3 - Kd*k_1^2 + (Kp-1)*k_1 + (-Ki) = 0,
%       k_2   = Kd - k_1,
%       gamma = ki/k1,
%
% To find the PID gains, calculate:
%
%       kp = K_1*K_2 + 1 + Gamma,
%       kd = K_1 + K_2,
%       ki = Gamma*K_1,
%
% -------------------------------------------------------------------------
% 1) PID to backstepping:
%
% Inputs:
%   -Kp: proportional gain of the PID control law
%   -Ki: Integral     gain of the PID control law
%   -Kd: derivative   gain of the PID control law
%
% Outputs:
%   -k1:  1st gain of the adaptive backstepping control law
%   -k2:  2nd gain of the adaptive backstepping control law
%   -gamma:  adaptation gain of the adaptive backstepping control law
%
% -------------------------------------------------------------------------
% 2) backstepping to PID:
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
% Created by Ahmad Kourani, PhD candidate, March 2021
% Vision and Robotics Lab,
% American University of Beirut.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% The PID gains can be calculated for a set of 3 system poles as follows:
% p1 = 0.5 - 0.1j;
% p2 = 0.5 + 0.1j;
% p3 = 30.0;
% 
% kp = p1*p2 + p3*(p1+p2);
% ki = p1*p2*p3;
% kd = p1 + p2 + p3;

%% To find the backstepping gains for a set of PID gains:

Kp = 3.3; % select desired kp value
Ki = 0.4; % select desired ki value
Kd = 0.6; % select desired kd value

a = 1;
b = -Kd;
c = Kp-1;
d = -Ki;

% Delta is positive only if all three solotion the polynomial are positive.
Delta = 18*a*b*c*d - 4*b^3*d + b^2*c^2 - 4*a*c^3 - 27*a^2*d^2; 

% k^3 + (-kd)*k^2 + (kp-1)*k + (-ki) = 0
p = [a b c d];
r = roots(p)
k1 = r(r==real(r))
k2 = Kd - k1
gamma = Ki./k1

pause()
%% To find the PID gains for a set of backstepping gains:

K1 = 3.8;
K2 = 0.2;
Gamma = 1;

kp = 1 + K1*K2 + Gamma
kd = K1 + K2
ki = Gamma*k1

