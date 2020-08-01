clear
clc
close all

% Script of MatLab Problem Set 1 

xVect = -1: 0.1: 9.1;
xValue = [ 1 3 9 ];
N1 = 1;
N2 = 10;
N3 = 100;

function [ sum ] = taylor_series( x, N )
  sum = 1;
  
  for n = 1: N
    sum = sum + (x.^n)./factorial(n)
    n = n + 1;
    endfor 
    
endfunction


target_graph = exp(xVect);

figure(1);
plot(xVect, target_graph)
title('Target Series (e^x)')
xlabel('x Values')
ylabel('Sum')

figure(2);
plot(xVect, taylor_series(xVect, N1))
title('Taylor Series Expansion (n = 1)')
xlabel('x Values')
ylabel('Sum')

figure(3);
plot(xVect, taylor_series(xVect, N2))
title('Taylor Series Expansion (n = 10)')
xlabel('x Values')
ylabel('Sum')

figure(4);
plot(xVect, taylor_series(xVect, N3))
title('Taylor Series Expansion (n = 100)')
xlabel('x Values')
ylabel('Sum')



