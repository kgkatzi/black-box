clc
close all
clear
t = 0 : 0.01 : 20;
u = @(t) (cos(t) + 2*  sin(2 * t));
[y, ts] = sys(t, u);   %get output

u2= @(t) (cos(5*t) + 7*  sin(t));   %different input
[y2, ts2] = sys(t, u2);

z=y+y2;   %add outputs from different inputs
figure
subplot(3, 1, 1);
plot(ts,z, 'LineWidth', 2, 'Color', "yellow")
xline(0)
yline(0)
xlabel("time")
ylabel("outputs")
title("Seperate outputs from different inputs")


u3=@(t) (cos(t) + 2*  sin(2 * t))+(cos(5*t) + 7*  sin(t));  %add inputs
[y3, ts3] = sys(t, u3);


subplot(3, 1, 2);
plot(ts,y3, 'LineWidth', 2, 'Color', "green")
xline(0)
yline(0)
xlabel("time")
ylabel("outputs")
title("Output from added inputs")

e=z-y3;    %error
subplot(3,1,3)
plot(ts,e, 'LineWidth', 2, 'Color', "red")
xline(0)
yline(0)
xlabel("time")
ylabel("error")
title("Error")
