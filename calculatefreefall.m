% a = -g;
% v = -gt + v0;
% y = -1/2 gt^2 + v0t + y0
g = 9.81; %m/s^2
y0 = 100; %meter
v0 = 0;
t = linspace(0,10,1000);
v = -g*t + v0;
y = -0.5*g*t.^2 + v0*t + y0;

ind = find(y>=0);
y = y(ind);
v = v(ind);
t = t(ind);

subplot(2,2,1)
plot(t(1),y(1), 'b',LineWidth=2)
title('position y-t')
xlabel('time(s)')
ylabel('height(m)')
pline = animatedline('Color','b',LineWidth=2);
xlim([0 max(t)])
ylim([0 y0+10])

subplot(2,2,3)
plot(t(1),v(1), 'r', LineWidth=2)
title('velocity v-t')
xlabel('time(s)')
ylabel('velocity(m/s)')
vline = animatedline('Color','r',LineWidth=2);
xlim([0 max(t)])
ylim([min(v)-5 0])

subplot(2,2,[2 4])
p = plot(0, y(1), 'go',MarkerFaceColor='k', MarkerSize=12);
ylim([0 110])

for i = 1:length(t)
    set(p,Ydata=y(i));

    subplot(2,2,1)
    addpoints(pline,t(i),y(i))

    subplot(2,2,3)
    addpoints(vline,t(i),v(i))

    drawnow
end
