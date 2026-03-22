clc;
clear;

x=[1 2 3 4];
h = [1 2];

N = max(length(x),length(h));
x = [x zeros(1,N-length(x))];
h = [h zeros(1,N-length(h))];

y = zeros(1,N);

for n=1:N
    for k=1:N
        index = mod(n-k,N)+1;
        y(n) = y(n)+x(k)*h(index);
    end
end

disp(y);
