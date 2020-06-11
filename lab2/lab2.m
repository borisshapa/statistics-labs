pkg load statistics
clc
clear

a = -1;
sigma = 0.5;
t0 = -1;
F = normcdf(t0, a, sigma);

n = 10^4;
m = 10^2;

y = normrnd(a, sigma, n, m);
P = mean(y < t0);

gamma = 0.95;
T = norminv((1 + gamma) / 2);
delta = T * sqrt(P .* (1 - P) / n);
lower_bound = P - delta;
upper_bound = P + delta;

x = 1:1:m;
x1 = 1:0.1:m;

for i = 1:100 
  f(i) = F;
endfor

plot(x, lower_bound, "g*-", x, upper_bound, "g*-", x, f, "r.-")

l = sum(lower_bound > F) + sum(upper_bound < F)