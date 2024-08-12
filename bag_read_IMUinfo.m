close all
clear
%ros2genmsg("C:\Users\trial\OneDrive\ackermann_msgs-ros2"); %1回ビルドすればいいらしい
%bagReader = ros2bagreader("rosbag2_2024_08_03-19_18_01\"); %初期データ
bagReader = ros2bagreader("rosbag2_2024_08_12-13_49_44\");

bagSel1 = select(bagReader,"Topic","/vehicle_state");
bagSel2 = select(bagReader,"Topic","/steering");
bagSel3 = select(bagReader,"Topic","/vehicle_velocity");

vehicle_state = readMessages(bagSel1);
steering = readMessages(bagSel2);
vehicle_velocity = readMessages(bagSel3);

%msgs = readMessages(bagReader);
time1=double(cellfun(@(msg) msg.header.stamp.sec,vehicle_state))+ (10^-9)*double(cellfun(@(msg) msg.header.stamp.nanosec,vehicle_state));
time1=time1-time1(1);
yawrate=cellfun(@(msg) msg.angular_velocity.z,vehicle_state);

time2=double(cellfun(@(msg) msg.header.stamp.sec,steering))+ (10^-9)*double(cellfun(@(msg) msg.header.stamp.nanosec,steering));
time2=time2-time2(1);
u=cellfun(@(msg) msg.drive.steering_angle,steering);

time3=double(cellfun(@(msg) msg.header.stamp.sec,vehicle_velocity))+ (10^-9)*double(cellfun(@(msg) msg.header.stamp.nanosec,vehicle_velocity));
time3=time3-time3(1);
v=cellfun(@(msg) msg.twist.linear.x,vehicle_velocity);

wP0=7.162676;
wP1=-0.032850;
wP2=0.002577;
wI0=11.496442;
wI1=-1.871542;
wI2=0.090255;

kp=wP0+wP1*v+wP2*v.*v;
ki=wI0+wI1*v+wI2*v.*v;

load("matlab.mat","rr");
load("matlab.mat","vv");
load("matlab.mat","tt");

Td=tf([1],[0.5,1]);

figure(1)
plot(time1,yawrate,'linewidth',8);
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
plot(time2,u,'linewidth',8);
hold on;

xlabel('Time [s]');
ylabel('Steering angle [rad]');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);

figure(3)
plot(time3,v,'linewidth',8);
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
plot(time3,kp,'linewidth',8);
hold on;

xlabel('Time [s]');
ylabel('P gain');
hold on;
set(gca,'FontSize',45);
xlim([0 45]);

figure(6)
plot(time3,ki,'linewidth',8);
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