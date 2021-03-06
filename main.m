%以下为主程序，主要为原始信号的产生，观察信号和解混信号的作图
clear all;
clc;
N=200;n=1:N;%N为采样点数
s1=2*sin(0.02*pi*n);%正弦信号
t=1:N;s2=2*square(100*t,50);%方波信号
a=linspace(1,-1,25);s3=2*[a,a,a,a,a,a,a,a];%锯齿信号
s4=rand(1,N);%随机噪声
S=[s1;s2;s3;s4];%信号组成4*N
A=rand(4,4);
X=A*S;%观察信号
%源信号波形图
figure(1);subplot(4,1,1);plot(s1);axis([0 N -5,5]);title('2(a)源信号');
subplot(4,1,2);plot(s2);axis([0 N -5,5]);
subplot(4,1,3);plot(s3);axis([0 N -5,5]);
subplot(4,1,4);plot(s4);xlabel('Time/ms');
%观察信号（混合信号）波形图
figure(2);subplot(4,1,1);plot(X(1,:));title('2(b)观察信号（混合信号）');
subplot(4,1,2);plot(X(2,:));
subplot(4,1,3);plot(X(3,:));subplot(4,1,4);plot(X(4,:));
Z=FastICA(X);
figure(3);subplot(4,1,1);plot(Z(1,:));title('2(c)解混后的信号');
subplot(4,1,2);plot(Z(2,:));
subplot(4,1,3);plot(Z(3,:));
subplot(4,1,4);plot(Z(4,:));xlabel('Time/ms');