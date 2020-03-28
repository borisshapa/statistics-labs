pkg load statistics;
clc;
clear;

E = 1;
sigma = 1;

n = 100;
m = 1;

v = sort(normrnd(E, sigma, n, m));

Fn = 1 / n : 1 / n : 1;
[a, b] = stairs(v, Fn);

x = E - 3 * sigma : 0.5 : E + 3 * sigma;
F = normcdf(x, E, sigma);

d = 1.36 / sqrt(n);
b1 = max(0, b - d);
b2 = min(1, b + d);
plot(a, b, x, F, a, b1, a, b2), grid; 