clc;    %��������д���
clear;  %��չ�����

data = dlmread('data.dat');     %���ı��ж�ȡ���ݣ����ʣ�100Hz

gyro_original = data(:, 3:5);   %����ԭʼ���ݣ���λ��deg/s
acc_original  = data(:, 7:9);   %�Ӽ�ԭʼ���ݣ���λ��g

gyro_mean_1s = filter_mean(gyro_original, 100);     %����1s��ֵ�˲�
acc_mean_1s  = filter_mean(acc_original, 100);      %�Ӽ�1s��ֵ�˲�

gyro_mean_10s = filter_mean(gyro_original, 1000);   %����10s��ֵ�˲�
acc_mean_10s  = filter_mean(acc_original, 1000);    %�Ӽ�10s��ֵ�˲�

time_original = 0:0.01:(length(gyro_original) - 1) * 0.01;  %����ʱ�����ݣ����0.01s
time_mean_1s  = 0:1:(length(gyro_mean_1s) - 1) * 1;         %����ʱ�����ݣ����1s
time_mean_10s = 0:10:(length(gyro_mean_10s) - 1) * 10;      %����ʱ�����ݣ����10s

figure('name', 'ԭʼ����'); %�½���ͼ����

subplot(2, 3, 1);                           %��һ����ͼ
plot(time_original, gyro_original(:, 1));   %��ͼ
title('���� X��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_x(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 2);                           %�ڶ�����ͼ
plot(time_original, gyro_original(:, 2));   %��ͼ
title('���� Y��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_y(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 3);                           %��������ͼ
plot(time_original, gyro_original(:, 3));   %��ͼ
title('���� Z��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_z(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 4);                           %���ķ���ͼ
plot(time_original, acc_original(:, 1));    %��ͼ
title('�Ӽ� X��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_x(g)');                         %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 5);                           %�������ͼ
plot(time_original, acc_original(:, 2));    %��ͼ
title('�Ӽ� Y��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_y(g)');                         %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 6);                           %��������ͼ
plot(time_original, acc_original(:, 3));    %��ͼ
title('�Ӽ� Z��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_z(g)');                         %���y���ǩ
grid on;                                    %���������

figure('name', '1s��ֵ'); %�½���ͼ����

subplot(2, 3, 1);                           %��һ����ͼ
plot(time_mean_1s, gyro_mean_1s(:, 1));     %��ͼ
title('���� X��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_x(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 2);                           %�ڶ�����ͼ
plot(time_mean_1s, gyro_mean_1s(:, 2));     %��ͼ
title('���� Y��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_y(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 3);                           %��������ͼ
plot(time_mean_1s, gyro_mean_1s(:, 3));     %��ͼ
title('���� Z��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_z(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 4);                           %���ķ���ͼ
plot(time_mean_1s, acc_mean_1s(:, 1));      %��ͼ
title('�Ӽ� X��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_x(g)');                         %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 5);                           %�������ͼ
plot(time_mean_1s, acc_mean_1s(:, 2));      %��ͼ
title('�Ӽ� Y��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_y(g)');                         %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 6);                           %��������ͼ
plot(time_mean_1s, acc_mean_1s(:, 3));      %��ͼ
title('�Ӽ� Z��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_z(g)');                         %���y���ǩ
grid on;                                    %���������

figure('name', '10s��ֵ'); %�½���ͼ����

subplot(2, 3, 1);                           %��һ����ͼ
plot(time_mean_10s, gyro_mean_10s(:, 1));   %��ͼ
title('���� X��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_x(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 2);                           %�ڶ�����ͼ
plot(time_mean_10s, gyro_mean_10s(:, 2));   %��ͼ
title('���� Y��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_y(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 3);                           %��������ͼ
plot(time_mean_10s, gyro_mean_10s(:, 3));   %��ͼ
title('���� Z��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('gyro_z(deg/s)');                    %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 4);                           %���ķ���ͼ
plot(time_mean_10s, acc_mean_10s(:, 1));    %��ͼ
title('�Ӽ� X��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_x(g)');                         %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 5);                           %�������ͼ
plot(time_mean_10s, acc_mean_10s(:, 2));    %��ͼ
title('�Ӽ� Y��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_y(g)');                         %���y���ǩ
grid on;                                    %���������

subplot(2, 3, 6);                           %��������ͼ
plot(time_mean_10s, acc_mean_10s(:, 3));    %��ͼ
title('�Ӽ� Z��');                          %��ӱ���
xlabel('time(sec)');                        %���x���ǩ
ylabel('acc_z(g)');                         %���y���ǩ
grid on;                                    %���������
