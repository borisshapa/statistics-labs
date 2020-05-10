clc;
clear;

pkg load statistics;
n = 1e6;
m = 1e2;


x = sort(randn(1, n));
y = hist(x, m);
y = y / n;

step = (x(n) - x(1)) / m
f = y / step

[stx, sty] = stairs(x(1) : step : x(end), [f, f(end)]);
plot(-6:0.1:6, normpdf(-6:0.1:6), stx, sty)