%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 'hyperbolla_rotation.m' draws a horizontal hyperbola then draws its 
% rotated version with an angle theta.
% This is to demonstate the true nature of the PID-backstepping gains
% similarity for constant Kp lines.
%
% -------------------------------------------------------------------------
% Inputs:
%   -   kp:  constant proportional gain the PID control law.
%   -theta:  angle of rotation in radians, the relevant value is pi/8.
%
% -------------------------------------------------------------------------
% Outputs:
%   -    x0,y0:  coordinates of the horizontal hyperbola.
%   -    xr,yr:  coordinates of the upper branch of the rotated hyperbola.
%   -xr_n,yr_n:  coordinates of the lower branch of the rotated hyperbola.
%
% -------------------------------------------------------------------------
% Created by Ahmad Kourani, PhD candidate, April 2021
% Vision and Robotics Lab,
% American University of Beirut.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
clear 
close all

kp = 5;
gamma = 0;
a = kp-gamma-1;
ap = sqrt( 2*a / ( sqrt(2)-1) );
bp = sqrt( 2*a / ( sqrt(2)+1) );

h = 0;
k = 0;

x0 = [0:0.01:10]';
y0 = sqrt( bp^2 *( (x0-h).^2/ap^2 -1 ) ) + k;

plot(x0,y0)
hold on
plot(x0,-y0)
grid on

%% apply rotation:
theta = pi/8;

xr = x0 * cos(theta) - y0 * sin(theta);
yr = x0 * sin(theta) + y0 * cos(theta);

xr_n = x0 * cos(theta) - (-y0) * sin(theta);
yr_n = x0 * sin(theta) + (-y0) * cos(theta);

plot(xr,yr)
plot(xr_n,yr_n)

sqrt(2/(sqrt(2)-1))*cos(theta)

v_x = ap*cos(theta)
v_y = ap*sin(theta)


