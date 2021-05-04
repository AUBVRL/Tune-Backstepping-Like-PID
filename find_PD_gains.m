
%%
kp = 1;
kd = 1.1;
gamma = 0.4;
a = 1;
b = -kd;
c = Kp - 1 - gamma;

p = [a b c];
r = roots(p)
ki = gamma*max(r)
pause()

%% 
k1 = 3.7;
k2 = 0.3;
Kp = 1 + k1*k2 + gamma
kd = k1 + k2

Kp_max = kd^2/4 + 1 + gamma
Kv_min = 2*sqrt(Kp - gamma - 1)
