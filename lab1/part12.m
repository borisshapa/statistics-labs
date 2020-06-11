clc;

pkg load nan;
pkg load statistics;

function retval = f(x)
  retval = sqrt(abs(x)) ;
endfunction

function retval = g(x)
  retval = sqrt(2 * pi) * f(x);
endfunction

function [P, lb, ub, d] = monte_carlo(n)
  Ex = -1;
  sigma = 1;
  gamma = 0.95;
  T = norminv((gamma + 1) / 2);
  x = normrnd(Ex, sigma, 1, n);
  Fx = arrayfun(@g, x);
  P = mean(Fx);
  d = (T * std(Fx)) / sqrt(n);
  lb = P - d;
  ub = P + d;
endfunction

[P, lb, ub, d] = monte_carlo(10^4);
printf("%d %g %g %g\n", P, lb, ub, d);
[P, lb, ub, d] = monte_carlo(10^6);
printf("%d %g %g %g\n", P, lb, ub, d);

integral = quad('sqrt(abs(x)) * exp(-((x + 1)^2) / 2)', -inf, inf);
printf("%g\n", integral);