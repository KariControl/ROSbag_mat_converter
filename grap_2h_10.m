figure(1)
plot(tt,yy,'linewidth',8);
hold on;
plot(tt,lsim(Td,rr,tt),'--','linewidth',8);
hold on;
plot(tt,rr,'-.','linewidth',8);
hold on
xlabel('Time [s]');
ylabel('Yaw-rate [rad/s]');
legend('output','desired','reference');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);
ylim([-0.6 0.6]); 

figure(2)
plot(tt,uu,'linewidth',8);
hold on;
% plot(t1,voltage1(1:25000,1),'linewidth',8);
hold on;
% plot(t1,voltage2(1:25000,1),'linewidth',8);

xlabel('Time [s]');
ylabel('Steering angle [rad]');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);
% ylim([-0.3 0.6]); 

figure(3)
plot(tt,vv,'linewidth',8);
hold on;

xlabel('Time [s]');
ylabel('Velocity [m/s]');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);

figure(4)
plot(tt,rr,'linewidth',8);
hold on;

xlabel('Time [s]');
ylabel('Target yaw-rate [rad/s]');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);

figure(5)
plot(tt,kp,'linewidth',8);
hold on;

xlabel('Time [s]');
ylabel('P gain');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);

figure(6)
plot(tt,ki,'linewidth',8);
hold on;

xlabel('Time [s]');
ylabel('I gain');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);

figure(7)
plot(tt,rr,'linewidth',8);
hold on;
xlabel('Time [s]');
ylabel('Reference [rad/s]');
% legend('output','desired','reference');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);
ylim([-0.6 0.6]); 

figure(8)
plot(tt,vv,'linewidth',8);
hold on;
xlabel('Time [s]');
ylabel('Velocity [m/s]');
% legend('output','desired','reference');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);
% ylim([-0.6 0.6]); 