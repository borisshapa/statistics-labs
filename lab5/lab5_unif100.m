clc;
clear;

pkg load statistics;

c1 = 0.4;
c2 = 0.9;

n = 100;
m = 100;
a = 0;
delta = 1;

x = unifrnd(a - delta / 2, a + delta / 2, n, m);

Davg = delta ^ 2 / (12 * n);
Dmed = delta ^ 2 / (4 * n);
Dminmax = delta ^ 2 / (2 * n ^ 2);

Tsigma_avg = sqrt(Davg);
Tsigma_med = sqrt(Dmed);
Tsigma_minmax = sqrt(Dminmax);

printf("Theoretical sigma:\n\taverage: %f,\n\tmedian: %f,\n\tminmax: %f\n", Tsigma_avg, Tsigma_med, Tsigma_minmax);

Eavg = mean(x);
Emed = median(x);
Eminmax = (min(x) + max(x)) ./ 2;

sigma_avg = std(Eavg);
sigma_med = std(Emed);
sigma_minmax = std(Eminmax);

printf("Practical sigma:\n\taverage: %f,\n\tmedian: %f,\n\tminmax: %f\n", sigma_avg, sigma_med, sigma_minmax);
