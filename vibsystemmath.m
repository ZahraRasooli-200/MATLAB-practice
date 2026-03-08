m = 1;
k = 20;

c_cr = 2*sqrt(k*m);
c_ud = 4;
c_od = 15;

time = [0,10];
x0 = [1;0];
[t1, x1] = ode45(@(t,x) vibsys(t,x,m,c_cr,k),time,x0);
[t2, x2] = ode45(@(t,x) vibsys(t,x,m,c_ud,k),time,x0);
[t3, x3] = ode45(@(t,x) vibsys(t,x,m,c_od,k),time,x0);

plot(t1,x1(:,1),LineWidth=2)
hold on
plot(t2,x2(:,1),LineWidth=2)
plot(t3,x3(:,1),LineWidth=2)
title('Mass-Spring-Damper system response')
xlabel('Time(s)')
ylabel('Displacement(m)')
legend('Critical Damped','Under Damped','Over Damped')
grid on