% Question 1.1

% clc; clear;
% 
% x = [0 1 2 3];
% N = length(x);
% 
% X = zeros(1, N);
% 
% for k = 0:N-1
%     for n = 0:N-1
%         X(k+1) = X(k+1) + x(n+1)*exp(-1j*2*pi*k*n/N);
%     end
% end
% 
% disp('DFT X[k] =');
% disp(X);
%----------------
% Question-1.2

% x_rec = zeros(1, N);
% 
% for n = 0:N-1
%     for k = 0:N-1
%         x_rec(n+1) = x_rec(n+1) + X(k+1)*exp(1j*2*pi*k*n/N);
%     end
%     x_rec(n+1) = x_rec(n+1)/N;
% end
% 
% disp('Reconstructed x[n] using IDFT =');
% disp(x_rec);
%---------------------------------
% Question 2

% clc; clear;
% 
% x = [0 1 2 3];
% N = length(x);
% 
% n = 0:N-1;
% k = n';
% 
% W = exp(-1j*2*pi/N);
% DFT_matrix = W.^(k*n);
% 
% X = DFT_matrix * x.';
% 
% disp('DFT using matrix method =');
% disp(X.');
% 
% % IDFT
% IDFT_matrix = conj(DFT_matrix)/N;
% x_rec = IDFT_matrix * X;
% 
% disp('Reconstructed x[n] =');
% disp(x_rec.');
% -------------------------------------
% Question 3

% clc; clear;
% 
% x = [0 1 2 3];
% 
% X_matlab = fft(x);
% x_matlab = ifft(X_matlab);
% 
% disp('MATLAB FFT =');
% disp(X_matlab);
% 
% disp('MATLAB IFFT =');
% disp(x_matlab);
%--------------------------------------
% Question 4.1

% clc; clear;
% 
% x = [0 1 2 3];
% N = length(x);
% stages = log2(N);
% 
% % Bit reversal
% n = 0:N-1;
% rev = bitrevorder(n+1);
% x = x(rev);
% 
% for s = 1:stages
%     m = 2^s;
%     wm = exp(-1j*2*pi/m);
%     for k = 1:m:N
%         w = 1;
%         for j = 0:(m/2 - 1)
%             t = w * x(k+j+m/2);
%             u = x(k+j);
%             x(k+j) = u + t;
%             x(k+j+m/2) = u - t;
%             w = w * wm;
%         end
%     end
% end
% 
% X_dit = x;
% disp('DIT FFT Output =');
% disp(X_dit);
%------------------------
% Question 4.2

% clc; clear;
% 
% x = [0 1 2 3];
% N = length(x);
% stages = log2(N);
% 
% for s = stages:-1:1
%     m = 2^s;
%     wm = exp(-1j*2*pi/m);
%     for k = 1:m:N
%         w = 1;
%         for j = 0:(m/2 - 1)
%             u = x(k+j);
%             v = x(k+j+m/2);
%             x(k+j) = u + v;
%             x(k+j+m/2) = (u - v)*w;
%             w = w * wm;
%         end
%     end
% end
% 
% X_dif = x(bitrevorder(1:N));
% 
% disp('DIF FFT Output =');
% disp(X_dif);
%-------------------
% Question 4.3

% X = X_dit;
% x_ifft = conj(fft(conj(X)))/N;
% 
% disp('IFFT Output =');
% disp(x_ifft);
% ---------------------------
% Question 5

% clc; clear;
% 
% x = [0 1 2 3];
% 
% X_builtin = fft(x);
% x_builtin = ifft(X_builtin);
% 
% disp('Built-in FFT =');
% disp(X_builtin);
% 
% disp('Built-in IFFT =');
% disp(x_builtin);
%-----------------------------