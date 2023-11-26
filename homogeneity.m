clc
close all
clear
t = 0 : 0.001 : 20;
u = @(t) (cos(t) + 2*  sin(2 * t));
[y, ts] = sys(t, u);   %get output

figure
subplot(3, 1, 1);
plot(ts,y, 'LineWidth', 2, 'Color', "yellow")
xline(0)
yline(0)
xlabel("time")
ylabel("output")
title("Output")

k=7;


u2 = @(t) k*(cos(t) + 2*  sin(2 * t));   %multiply input with 7
[y2, ts2] = sys(t, u2);   
z=y2/k;         %prove homogeneity ku=ky

subplot(3, 1, 2);
plot(ts,z, 'LineWidth', 2, 'Color', "green")
xline(0)
yline(0)
xlabel("time")
ylabel("output")
title("Output when input had scaling factor, divided by the scaling factor")

e=y-z;

subplot(3, 1, 3);
plot(ts,e, 'LineWidth', 2, 'Color', "red")
xline(0)
yline(0)
xlabel("time")
ylabel("error")
title("Error")
