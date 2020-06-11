pkg load nan;
pkg load statistics;

function retval = f(x)
  retval = log(4 - x) / (x + 2);
endfunction

function [P, lb, ub, d] = monte_carlo(n)
  a = 1;
  b = 3;
  gamma = 0.95;
  T = norminv((gamma + 1) / 2);
  x = unifrnd(a, b, 1, n);
  Fx = arrayfun(@f, x');
  P = mean(Fx) * (b - a);
  d = (T * std(Fx)) / sqrt(n);
  lb = P - d;
  ub = P + d;
endfunction

[P, lb, ub, d] = monte_carlo(10^4);
printf("%d %g %g %g\n", P, lb, ub, d);
[P, lb, ub, d] = monte_carlo(10^6);
printf("%d %g %g %g\n", P, lb, ub, d);

integral = quad(@f, 1, 3);
printf("%g\n", integral);