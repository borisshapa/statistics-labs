clc;
clear;

pkg load statistics;

n = 1e6;
m = 1e2;

errorsI = 0;
gamma = 0.95;

for i = 1:m
  x = sort(normrnd(1, 3, n, 1));

  y = hist(x, m);
  step = (x(n) - x(1)) / m;
  
  E = mean(x);
  sigma = std(x);
  
  l = x(1)
  r = x(1) + step
  
  i = 1;
  hi2 = 0;
  seg_cnt = 0;
  while (i <= m) 
    y_i = y(i);
    while (y_i < 6 && i++ < m)
      y_i += y(i);
      r += step
    endwhile
    y1 = normcdf(l, E, sigma);
    y2 = normcdf(r, E, sigma);
    p = y2 - y1;
    hi2 += (y_i - n * p) ^ 2 / (n * p);
    l = r;
    r += step;
    i++;
    seg_cnt++;
  endwhile
  
  threshold = chi2inv(gamma, seg_cnt - 3);
  if (hi2 >= threshold)
    errorsI++;
  endif
endfor

printf("Alpha: %d\n", 1 - gamma);
printf("Estimated alpha: %d\n", errorsI / m);