clc;
clear;

pkg load statistics;
n = 1e6;
m = 1e2;


x = randn(1, n);
[y, centers] = hist(x, m);
y = y / n;
[stx, sty] = stairs(centers, y);
plot(-6:0.1:6, normpdf(-6:0.1:6), stx, sty)
