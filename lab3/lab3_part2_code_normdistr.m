pkg load statistics;
clc;
clear;

E = 1;
sigma = 1;
n = 10^2;
Fn = 1 / n : 1 / n : 1;

fprintf("Selection: %d\nI type error\n\n", n);
for m = 100:100:1000
  fprintf("m = %d\n", m);
  v = sort(normrnd(E, sigma, n, m));
  F = normcdf(v, E, sigma);
  diff = F - Fn';
  sup = max(max(abs(diff), abs(diff - 1 / n)));
  kolmogorov = sqrt(n) * sup;
  k = mean(kolmogorov > 1.36);
  
  smirnov = 1 / (12*n) + sum((diff + 1 / (2*n)) .^ 2);
  s = mean(smirnov > 0.46);
  fprintf("Kolmogorov: %d\nSmirnov: %d\n\n", k, s);
endfor

fprintf("===================================\n\n")
fprintf("Selection: %d\nII type error\n\n", n);
v = sort(normrnd(E, sigma, n, m));
for a = 0:0.01:0.1
  fprintf("addition = %d\n", a);
  F = normcdf(v, E, sigma + a);
  diff = F - Fn';
  sup = max(max(abs(diff), abs(diff - 1 / n)));
  kolmogorov = sqrt(n) * sup;
  k = 1 - mean(kolmogorov > 1.36);
  
  smirnov = 1 / (12*n) + sum((diff + 1 / (2*n)) .^ 2);
  s = 1 - mean(smirnov > 0.46);
  fprintf("Kolmogorov: %d\nSmirnov: %d\n\n", k, s);
endfor

n = 10^4;
Fn = 1 / n : 1 / n : 1;

fprintf("===================================\n")
fprintf("===================================\n\n")
fprintf("Selection: %d\nI type error\n\n", n);
for m = 100:100:1000
  fprintf("m = %d\n", m);
  v = sort(normrnd(E, sigma, n, m));
  F = normcdf(v, E, sigma);
  diff = F - Fn';
  sup = max(max(abs(diff), abs(diff - 1 / n)));
  kolmogorov = sqrt(n) * sup;
  k = mean(kolmogorov > 1.36);
  
  smirnov = 1 / (12*n) + sum((diff + 1 / (2*n)) .^ 2);
  s = mean(smirnov > 0.46);
  fprintf("Kolmogorov: %d\nSmirnov: %d\n\n", k, s);
endfor

fprintf("===================================\n\n")
fprintf("Selection: %d\nII type error\n", n);
v = sort(normrnd(E, sigma, n, m));
for a = 0:0.01:0.1
  fprintf("addition = %d\n", a);
  F = normcdf(v, E, sigma + a);
  diff = F - Fn';
  sup = max(max(abs(diff), abs(diff - 1 / n)));
  kolmogorov = sqrt(n) * sup;
  k = 1 - mean(kolmogorov > 1.36);
  
  smirnov = 1 / (12*n) + sum((diff + 1 / (2*n)) .^ 2);
  s = 1 - mean(smirnov > 0.46);
  fprintf("Kolmogorov: %d\nSmirnov: %d\n\n", k, s);
endfor