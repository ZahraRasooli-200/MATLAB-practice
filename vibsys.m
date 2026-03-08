function dxdt = vibsys(~,x,m,c,k)
dxdt = zeros(2,1);
dxdt(1) = x(2);
dxdt(2) = -(k/m)*x(1) - (c/m)*x(2);
end