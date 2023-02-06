% single body example — from CP's notes, February 2023
% dont forget to initialize your simulation!

% run sim
% dt = tMax / nT;

nT = ceil(tMax / dt);
ts = dt*(0:nT);

xs = zeros(nT + 1);
ys = zeros(nT + 1);
us = zeros(nT + 1);
vs = zeros(nT + 1);


xs(1) = xstart;
ys(1) = ystart;

us(1) = ustart;
vs(1) = vstart;

for i = 1:nT
    x = xs(i);
    y = ys(i);

    r = sqrt(x^2 + y^2);
    us(i + 1) = us(i) - dt * G * M * (x / r^3);
    vs(i + 1) = vs(i) - dt * G * M * (y / r^3);

    xs(i + 1) = x + dt*us(i+1);
    ys(i + 1) = y + dt*vs(i+1);
end

% clf
plot(0,0,'r*')
hold on 
plot(xs, ys)
axis equal

