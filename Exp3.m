clc;
clear;

% Question-1
% X1 = [2 3 4];
% X2 = [3 4 5 6];
% X3 = conv(X1,X2);
% disp('Result of convolution:');
% disp(X3);
%--------------------------------
% Question-2:
% num = [1 0.4*sqrt(2)];
% den = [1 -0.8*sqrt(2) 0.64];
% n=0:20;
% x = impz(num,den,n);
% disp(x);
% stem(n,x,'filled');
% xlabel('n');
% ylabel('x[n]');
% title('Inverse Z transform (causal)');
% grid on;
%---------------------------------
% Question-3.a:
% num = [1];
% den = [1 -0.9];
% Hz = tf(num,den,-1);
% figure;
% zplane(num,den);
% title('Pole zero plot');
% grid on;
%----------------------------------
% Question-3.b:
% num = [1];
% den = [1 -0.9];
% [H w]=freqz(num,den,1024);
% figure;
% subplot(2,1,1);
% plot(w/pi, abs(H));
% title('magnitude plot');
% grid on;
% subplot(2,1,2);
% plot(w/pi, angle(H));
% title('phase plot');
% grid on;
%---------------------------------
% Question-3.c:
% num = [1];
% den = [1 -0.9];
% n = 0:20;
% h = impz(num,den,n);
% stem(n,h);
% 
% title('Impulse Response');
% grid on;
%-------------------------------
% Question-4:
n = 0:50;
x = cos(pi*n/3);
y = zeros(size(n));
y_minus1 = -2;
y_minus2 = -3;
x_minus1 = 1;
x_minus2 = 1;

for k=1:length(n)
  if k==1
    y(k)= (1/3)*(x(k)+x_minus1+x_minus2) + 0.95*y_minus1 - 0.9025*y_minus2;
  elseif k==2
      y(k) = (1/3)*(x(k)+x(k-1)+x_minus1) + 0.95*y(k-1) - 0.9025*y_minus1;
  else
       y(k) = (1/3)*(x(k)+x(k-1)+x(k-2)) + 0.95*y(k-1) - 0.9025*y(k-2);
  end 
end

figure;
stem(n,y);
xlabel('n');
ylabel('y(n)');
grid on;

