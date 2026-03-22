clc;
clear;

x=[1 2];
h = [1 2 4];
nx=  length(x);
nh  = length(h);
ny = nx+nh-1;

y=zeros(1,ny);

for n=1:ny
       for k=1:nx
           if(n-k+1>0 && n-k+1<ny)
               y(n) = y(n)+x(k)*h(n-k+1);
           end
       end
end

y_builtin = conv(x,h);

figure;
grid on;

subplot(2,1,1);
disp(y);
stem(y);
title("calculation based");

subplot(2,1,2);
disp(y_builtin);
stem(y_builtin);
title("built in fn based");
