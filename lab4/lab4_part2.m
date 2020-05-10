pkg load statistics

n = 10^6;
m = 10^2;

% normal distribution
mu = 1;
sigma = 3;


rndNorm = normrnd(mu, sigma, n, 1);
[nn, xx] = hist(rndNorm, m);
delta = (max(rndNorm) - min(rndNorm)) / m;
nn = nn / n / delta;
[xs, ys] = stairs(xx, nn);

Xs = min(rndNorm):0.01:max(rndNorm);
Ys = normpdf(Xs, mu, sigma);
plot(Xs, Ys, xs, ys);

n = 10^4;
m = 22;
k = 10^3;

gamma = 0.95;
npass = 0;
for check = 1:k
    rndNorm = normrnd(mu, sigma, n, 1);
    rndEx = mean(rndNorm);
    rndSigma = std(rndNorm);
    ah = min(rndNorm);
    bh = max(rndNorm);
    l = ah;
    step = (bh - ah) / m;
    [nn, xx] = hist(rndNorm, m);
    chi2 = 0;
    for j = 1:m
        pj0 = normcdf(l + step, rndEx, rndSigma) - normcdf(l, rndEx, rndSigma);
        chi2 += (nn(j) - n * pj0)^2 / (n * pj0);
        l += step;
    endfor
    npass = npass + (chi2 >= chi2inv(gamma, m - 3));
endfor

printf("Expected alpha: %f\n", 1 - gamma);
printf("Test alpha: %f\n", npass / k);