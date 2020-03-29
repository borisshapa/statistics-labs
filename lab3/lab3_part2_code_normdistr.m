pkg load statistics;
clc;
clear;

E = 1;
sigma = 1;
n = 10^4;
m = 100;

v = sort(normrnd(E, sigma, n, m));
Fn = 1 / n : 1 / n : 1;
F = normcdf(v, E, sigma);
kolmogorov = max(max(abs(F - Fn'), abs(F - Fn' - 1 / n)));
dn = sqrt(n) * kolmogorov;

k = mean(dn > 1.36);

for m = 100:200:1000
  fprintf("I type error for m=%d\n", m);
  v = sort(normrnd(E, sigma, n, m));
  F = normcdf(v, E, sigma);
  kolmogorov = max(max(abs(F - Fn'), abs(F - Fn' - 1 / n)));
  dn = sqrt(n) * kolmogorov;
  k = mean(dn > 1.36);
  k
endfor
