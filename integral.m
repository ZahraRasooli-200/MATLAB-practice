%syms x
%f = sin(x);
%int(f,x,0,1)

%syms y t
%g = x;
%a = 0;
%b = sin(t);
%int(g,y,a,b)

%f = @(x) x./sinh(x);
%I = trapezoid_integral(f,1,2,100)
%I2 = integral(f,0,1)

%f = @(x) sin(x./sqrt(1+x));
%a = 0;
%b = pi;
%I = integral(f, a, b)

f = @(x) sin(x./sqrt(c+x));
a = 0;
b = pi;
I = integral(@(x) f(x,3), a, b)
