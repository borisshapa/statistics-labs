clc;
clear;

pkg load statistics;

n = 1e6;
m = 1e2;

gamma = 0.95;

for eps = 0 : 0.01 : 0.05
  errorsII = 0;
  
  for i = 1:m
    x = sort(normrnd(1, 3, n, 1));

    y = hist(x, m);
    step = (x(n) - x(1)) / m;
    
    E = mean(x) + eps;
    sigma = std(x);
    
    y1 = normcdf(x(1) : step : x(end) - step, E, sigma);
    y2 = normcdf(x(1) + step : step : x(end), E, sigma);
    
    p = y2 - y1;
    hi2 = sum(((y - n * p) .^ 2) ./ (n * p));
    threshold = chi2inv(gamma, m - 3);
    if (hi2 < threshold)
      errorsII++;
    endif
  endfor

  printf("Estimated beta for eps = %d: %d\n", eps, errorsII / m);
endfor