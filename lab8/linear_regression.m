clc;
clear;

% Input
x_min = -2.2;
x_max = 2.5;
n = 69;
c1=3.5; 
c2=-4.2; 
s = 1.5;

X = (x_min : (x_max - x_min) / (n - 1) : x_max)';
y = c2 + c1 * X;

% Experimental data generation
Z = s * randn(n,1); 
Y = y + Z;
% Control:
plot(X, y, X, Y);

% Reсovering the function y
xn = mean(X);
yn = mean(Y); 
cov = (X - xn)' * (Y - yn) / (n - 1);
b = cov / (std(X)^2);
Yn = yn + b * (X - xn);

% Assessment in the matlab package.
m=1;
cn = polyfit(X, Y, m);
Ynn = polyval(cn, X);
% Control:
plot(X, Y, '+', X, y, X, Yn, X, Ynn, 'o');

e = Yn - Y;
sp = e'*Yn;

% Assessment of noise level.
sn = sqrt(e' * e / (n - 2)); %сравнить с s

% Confidence bounds
ta = 1.96;
ha = ta * (sn / sqrt(n));
da = ha * (1 + (X - xn).^2 / (std(X)^2)).^(1 / 2);
Yn1 = Yn - da;
Yn2 = Yn + da;
plot(X, Yn1, X, Yn2, X, Y, 'o', X, Yn)

% Output
printf("Real coefficients: %d, %d\n", c1, c2);
printf("Calculated coefficients: %d, %d\n", cn(1), cn(2));
printf("Calculated coefficients with Matlab: %d, %d\n", b, yn - b * xn); 
printf("Scalar product: %d\n", sp);
printf("Read noise level: %d\n", s);
printf("Calculated noise level: %d\n", sn);