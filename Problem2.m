clear
clc
close all

% Script of Problem 2

x_vect = -3: 0.1: 3;

N1 = 1;
N2 = 2;
N3 = 3;
N4 = 100;

function [ sum ] = fourier_series( x, N)
  sum = 3/4;
  
  if ( n = 0 )
    sum = sum
    endif 
  for n = 1:N
    sum = sum + (((-1)^n - 1)/((n^2)*(pi^2)))*cos(n*pi*x) - ((1)/(n*pi))*sin(n*pi*x)
    n = n + 1;
    endfor

endfunction

figure(1);
plot(x_vect, fourier_series(x_vect, N1))
title('Sum of n = 1')
xlabel('x - Values')
ylabel('Summation')

figure(2);
plot(x_vect, fourier_series(x_vect, N2))
title('Sum when n = 2')
xlabel('x -Values')
ylabel('Summation')

figure(3);
plot(x_vect, fourier_series(x_vect, N3))
title('Sum when n = 3')
xlabel('x - Values')
ylabel('Summation')

figure(4);
plot(x_vect, fourier_series(x_vect, N4))
title('Sum when n = 100')
xlabel('x - Values')
ylabel('Summation')

figure(5);
plot(x_vect, fourier_series(x_vect, 0))
title('Sum when n = 0')
xlabel('x - Values')
ylabel('Summation')
