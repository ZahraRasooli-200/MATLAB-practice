function I = trapezoid_integral(f, a, b, n)
h = (b-a)/n;
x = linspace(a, b, n+1);
y = f(x);
I = h*(sum(y)- 0.5*y(1)- 0.5*y(end));
end