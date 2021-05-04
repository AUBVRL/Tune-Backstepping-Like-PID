close all

kp = 5;
gamma = 0;
a = kp+gamma-1;
ap = sqrt( 2*a / ( sqrt(2)-1) );
bp = sqrt( 2*a / ( sqrt(2)+1) );

h = 0;
k = 0;

xp = [0:0.01:10]';
yp = sqrt( bp^2 *( (xp-h).^2/ap^2 -1 ) ) + k;

plot(xp,yp)
hold on
plot(xp,-yp)
grid on

theta = pi/8;

x = xp * cos(theta) - yp * sin(theta);
y = xp * sin(theta) + yp * cos(theta);

xn = xp * cos(theta) - (-yp) * sin(theta);
yn = xp * sin(theta) + (-yp) * cos(theta);

plot(x,y)
plot(xn,yn)

sqrt(2/(sqrt(2)-1))*cos(pi/8)

v_x = ap*cos(pi/8)
v_y = ap*sin(pi/8)


