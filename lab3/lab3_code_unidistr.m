pkg load statistics;
clc;
clear;

x = -1;
y = 1;

n = 100;
m = 1;
v = sort(unifrnd(x, y, n, m));

Fn = 1 / n : 1 / n : 1;
Fx = -1 : 1 / n : 1;
F = unifcdf(Fx, x, y);
[a, b] = stairs(v, Fn);


d = 1.36 / sqrt(n);

b1 = max(0, b - d);
b2 = min(1, b + d);
<<<<<<< HEAD
plot(a, b, Fx, F, a, b1, a, b2), grid;
=======
plot(a, b, Fx, F, a, b1, a, b2), grid;
>>>>>>> c1adbae49ffc9f146facce866096af504809239e
