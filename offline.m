clc
close all
clear
i=2;   %choose degree 1 or 2
t = 0 : 0.01 : 20;
u = @(t) (sin(2 * t));

[y, ts] = sys(t, u);
u=feval(u,ts);  %make a double of the function results
if i==1
   l=2;
   phi(:,1)=lsim(tf(l,[1,1]),y,t);
   phi(:,2)=lsim(tf(1,[1,1]),u,t);
else
 l1=22;  %filter parameters
 l2=4;
 phi(:,1)=lsim(tf([1,0],[1,l1,l2]),y,t);  
 phi(:,2)=lsim(tf([l1,l2],[1,l1,l2]),y,t);
 phi(:,3)=lsim(tf(1,[1,l1,l2]),y,t);
 phi(:,4)=lsim(tf(1,[1,l1,l2]),u,t);
end
theta=transpose(y(:,1))*phi*inv(transpose(phi)*phi);
yhat=theta*transpose(phi);
e=y-transpose(yhat);
subplot(2,1,1)
plot(t,y, 'LineWidth', 2, 'Color', "yellow","DisplayName","Output")
hold on
plot(t,yhat, 'LineWidth', 2, 'Color', "blue","DisplayName","Estimation of output")
% Add legend for specific data
legend('show', 'Location', 'best');
xline(0,"HandleVisibility","off")
yline(0,"HandleVisibility","off")
subplot(2,1,2)
plot(t,e, 'LineWidth', 2, 'Color', "red")
xline(0)
yline(0)
title("Error")
if i==1
    sgtitle("1st degree system structure")
else
    sgtitle("2nd degree system structure")
end