clc;

pkg load nan;

function retval = f(x)
  a = 3;
  retval = exp(-a * x);
endfunction

function [P, lb, ub, d] = monte_carlo(n)
  k = 5;
  c = 0.94;
  gamma = 0.95;
  T = norminv((gamma + 1) / 2);
  x = rand(n, k);
  Fx = sum(arrayfun(@f, x'));
  P = mean(Fx <= c);
  d = T * sqrt(P * (1 - P) / n);
  lb = P - d;
  ub = P + d;
endfunction

[P, lb, ub, d] = monte_carlo(10^4);
printf("%d %g %g %g\n", P, lb, ub, d);
[P, lb, ub, d] = monte_carlo(10^6);
printf("%d %g %g %g\n", P, lb, ub, d);