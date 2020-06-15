clc;
clear;

% Input
x_min = -2.2; 
x_max = 2.5;
n = 69;
a1 = 1.7; a2 = -2.4; a3 = -3.6;
s=1.5;

X = (x_min : (x_max - x_min) / (n - 1) : x_max)';
y = a3 + a2 * X + a1 * X.^2;

% Experimental data generation
Z = s * randn(n, 1); 
Y = y + Z;
% Control:
plot(X, y, X, Y, '+');

% Reсovering the function y in the matlab package.
m=2;
an = polyfit(X, Y, m);
Yn = polyval(an, X);
% Control:
plot(X, Y, '+', X, y, X, Yn, 'o');

e = Yn - Y;
sp = e' * Yn;
sn = sqrt(e' * e / (n - 2));
% Output
printf("Real coefficients: %d, %d, %d\n", a1, a2, a3);
printf("Сalculated coefficients: %d, %d, %d\n", an(1), an(2), an(3));
printf("Scalar product: %d\n", sp);
printf("Real noise level: %d\n", s);
printf("Calculated noise level: %d\n", sn);