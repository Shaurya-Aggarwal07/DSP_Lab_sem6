% Clear workspace and close existing figures
clc;
clear;
close all;

% --- Helper Functions (defined as anonymous functions) ---
% Unit Step Function: u(n) = 1 for n >= 0, else 0
u = @(n) n >= 0;
% Impulse Function: delta(n) = 1 for n == 0, else 0
delta = @(n) n == 0;

%% Part (a), (b), (c): Basic Sequences
% Let's define an arbitrary range for these demonstration signals
n_basic = -10:10;

figure('Name', 'Basic Sequences', 'Color', 'w');

% a) Unit Step Sequence
subplot(3,1,1);
x_step = u(n_basic); 
stem(n_basic, x_step, 'filled', 'LineWidth', 1.5);
title('a) Unit Step Sequence u(n)');
xlabel('n'); ylabel('Amplitude'); grid on;

% b) Ramp Sequence: r(n) = n * u(n)
subplot(3,1,2);
x_ramp = n_basic .* u(n_basic);
stem(n_basic, x_ramp, 'filled', 'LineWidth', 1.5);
title('b) Ramp Sequence r(n)');
xlabel('n'); ylabel('Amplitude'); grid on;

% c) Exponential Sequence: e.g., x(n) = (0.8)^n * u(n)
subplot(3,1,3);
x_exp = (0.8).^n_basic .* u(n_basic);
stem(n_basic, x_exp, 'filled', 'LineWidth', 1.5);
title('c) Exponential Sequence (0.8)^n u(n)');
xlabel('n'); ylabel('Amplitude'); grid on;


%% Part (d): Specific Sequences over indicated intervals
figure('Name', 'Part D Sequences', 'Color', 'w');

% d.a) x(n) = 2*delta(n+2) - delta(n-4), -5 <= n <= 5
subplot(2,2,1);
n_a = -5:5;
x_a = 2*delta(n_a + 2) - delta(n_a - 4);
stem(n_a, x_a, 'filled', 'LineWidth', 1.5);
title('d.a) Impulse Combination');
xlabel('n'); grid on; axis([-6 6 -2 3]);

% d.b) x(n) = n[u(n)-u(n-10)] + 10e^-0.3(n-10)[u(n-10)-u(n-20)]
subplot(2,2,2);
n_b = 0:20;
% Note: Using logical indexing for the windows
term1 = n_b .* (u(n_b) - u(n_b - 10)); 
term2 = 10 * exp(-0.3*(n_b - 10)) .* (u(n_b - 10) - u(n_b - 20));
x_b = term1 + term2;
stem(n_b, x_b, 'filled', 'LineWidth', 1.5);
title('d.b) Piecewise Sequence');
xlabel('n'); grid on;

% d.c) x(n) = cos(0.04*pi*n) + 0.2w(n), 0 <= n <= 50
% w(n) is Gaussian noise (zero mean, unit variance)
subplot(2,2,3);
n_c = 0:50;
w_n = randn(size(n_c)); % randn generates Gaussian noise
x_c = cos(0.04*pi*n_c) + 0.2*w_n;
stem(n_c, x_c, 'filled');
title('d.c) Cosine with Gaussian Noise');
xlabel('n'); grid on;

% d.d) Periodic sequence {5,4,3,2,1} repeated
% Interval: -10 <= n <= 9 (Total 20 samples)
subplot(2,2,4);
n_d = -10:9;
pattern = [5, 4, 3, 2, 1];
% The range is length 20. Pattern is length 5. It fits 4 times.
x_d = repmat(pattern, 1, 4); 
stem(n_d, x_d, 'filled', 'LineWidth', 1.5);
title('d.d) Periodic Sequence');
xlabel('n'); grid on;


%% Part (e): Complex-valued signal
% x(n) = exp((-0.1 + j0.3)n), -10 <= n <= 10
figure('Name', 'Complex Signal', 'Color', 'w');
n_e = -10:10;
x_e = exp((-0.1 + 1j*0.3) .* n_e);

% Complex signals have Real/Imaginary parts or Magnitude/Phase
subplot(2,2,1);
stem(n_e, real(x_e), 'filled', 'LineWidth', 1.5);
title('Real Part'); xlabel('n'); grid on;

subplot(2,2,2);
stem(n_e, imag(x_e), 'filled', 'LineWidth', 1.5);
title('Imaginary Part'); xlabel('n'); grid on;

subplot(2,2,3);
stem(n_e, abs(x_e), 'filled', 'LineWidth', 1.5);
title('Magnitude'); xlabel('n'); grid on;

subplot(2,2,4);
stem(n_e, angle(x_e), 'filled', 'LineWidth', 1.5);
title('Phase (radians)'); xlabel('n'); grid on;