clc;
clear;

pkg load statistics;
n = 1e6;
m = 1e2;

a = 0;
b = 1;
x = sort(unifrnd(a, b, n, 1));
y = hist(x, m);
y = y / n;

step = (x(n) - x(1)) / m
f = y / step

[stx, sty] = stairs(x(1) : step : x(end), [f, f(end)]);
interval = a:0.001:b
plot(interval, unifpdf(interval, a, b), stx, sty, interval, 0)
