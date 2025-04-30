clc; clear; close all;

fm = 10; % Message signal frequency (Hz)
t = 0:0.001:1; % Continuous time
x = sin(2*pi*fm*t); % Message signal

% Sampling frequencies
fs1 = 15; % fs < 2fm (Undersampling)
fs2 = 20; % fs = 2fm (Nyquist Rate)
fs3 = 50; % fs > 2fm (Oversampling)

% Sampling time instances
n1 = 0:1/fs1:1;
n2 = 0:1/fs2:1;
n3 = 0:1/fs3:1;

x1 = sin(2*pi*fm*n1);
x2 = sin(2*pi*fm*n2);
x3 = sin(2*pi*fm*n3);

% Plotting
figure;
set(gcf, 'Position', [100, 100, 800, 600]); % Resize figure window

subplot(3,1,1);
plot(t, x, 'b', 'LineWidth', 2); hold on;
stem(n1, x1, 'ro', 'LineWidth', 1.5, 'MarkerFaceColor', 'r', 'MarkerSize', 6);
title('\bf{Aliasing - Undersampling (fs < 2f_m)}', 'FontSize', 14);
xlabel('Time (s)', 'FontSize', 12); ylabel('Amplitude', 'FontSize', 12);
grid on;

subplot(3,1,2);
plot(t, x, 'b', 'LineWidth', 2); hold on;
stem(n2, x2, 'go', 'LineWidth', 1.5, 'MarkerFaceColor', 'g', 'MarkerSize', 6);
title('\bf{Critical Sampling (fs = 2fmax) – Nyquist Rate}', 'FontSize', 14);
xlabel('Time (s)', 'FontSize', 12); ylabel('Amplitude', 'FontSize', 12);
grid on;

subplot(3,1,3);
plot(t, x, 'b', 'LineWidth', 2); hold on;
stem(n3, x3, 'mo', 'LineWidth', 1.5, 'MarkerFaceColor', 'm', 'MarkerSize', 6);
title('\bf{Oversampling (fs > 2fmax) – Smooth Reconstruction}', 'FontSize', 14);
xlabel('Time (s)', 'FontSize', 12); ylabel('Amplitude', 'FontSize', 12);
grid on;
