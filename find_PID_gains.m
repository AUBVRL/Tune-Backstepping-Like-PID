

% p1 = 0.5 - 0.1j;
% p2 = 0.5 + 0.1j;
% p3 = 30.0;
% 
% kp = p1*p2 + p3*(p1+p2);
% ki = p1*p2*p3;
% kd = p1 + p2 + p3;

%%
kp = 3.3;
ki = 0.4;
kd = 0.6;

a = 1;
b = -kd;
c = kp-1;
d = -ki;

Delta = 18*a*b*c*d - 4*b^3*d + b^2*c^2 - 4*a*c^3 - 27*a^2*d^2

% k^3 + (-kd)*k^2 + (kp-1)*k + (-ki) = 0
p = [a b c d];
r = roots(p)
k1 = r(r==real(r))
k2 = kd - k1
gamma = ki./k1

pause()
%% 
k1=3.8;
k2= 0.2;
gamma=1;

kp=1+k1*k2+gamma
kv=k1+k2
ki = gamma*k1
% Kp_max = kd^2/4+1-gamma
% Kv_min = 2*sqrt(kp+gamma-1)



