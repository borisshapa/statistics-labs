clc;
clear;

pkg load statistics;

n = 1e6;
m = 1e2;

a = 0;
b = 1;

errorsI = 0;
gamma = 0.95;

for i = 1:m
  x = sort(unifrnd(a, b, n, 1));
  mi = min(x);
  ma = max(x);
  
  y = hist(x, m);
  step = (x(n) - x(1)) / m;
  
  y1 = unifcdf(x(1) : step : x(end) - step, mi, ma);
  y2 = unifcdf(x(1) + step : step : x(end), mi, ma);
  
  p = y2 - y1;
  hi2 = sum(((y - n * p) .^ 2) ./ (n * p));
  threshold = chi2inv(gamma, m - 3);
  if (hi2 >= threshold)
    errorsI++;
  endif
endfor

printf("Alpha: %d\n", 1 - gamma);
printf("Estimated alpha: %d\n", errorsI / m);