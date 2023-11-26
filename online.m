clc
close all
clear
i=1;    %choose degree 1 or 2
t = 0 : 0.01 : 20;
u = @(t) ( sin(2 * t));
[y, ts] = sys(t, u);
u=feval(u,ts); 
if i==2
gamma=22;
 am=2;
 phi(:,1)=lsim(tf([1,0],[1,am]),y,t);
  phi(:,2)=lsim(tf(1,[1,am]),y,t);
   phi(:,3)=lsim(tf(1,[1,am]),u,t);
   [ts,theta_hat]=ode15s(@(tss,theta_hat)onlineparameters(tss,theta_hat,t,y, phi, gamma,i), t, [0 0 0]);
else
    gamma=20;
 am=2;
 phi(:,1)=lsim(tf(1,[1,am]),y,t);
   phi(:,2)=lsim(tf(1,[1,am]),u,t);
   [ts,theta_hat]=ode15s(@(tss,theta_hat)onlineparameters(tss,theta_hat,t,y, phi, gamma,i), t, [0 0]);
end
   yhat=theta_hat(length(t),:)*transpose(phi);
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