% Script that plots PAM raised cosine pulse shape
% Data Patter: 10010
% Bit Rate: 50kb/sec

clc
close all
clear all 

% Establishes Bit Rate, Time Range, Roll Off, and Beta
rb = 50E3;
Tb = 1/rb;
t = linspace(0, 100E-6, 100);
Alpha = [ 0 .5 1 ];

% Beta Function
function [ B ] = Beta(A, rb)
  B = A*rb / 2;
endfunction

B0 = Beta(Alpha(1), rb);
B5 = Beta(Alpha(2), rb);
B1 = Beta(Alpha(3), rb);

% Sample Time Function
function [ samp ] = ST(t, Tb, i)
  j = [ 1 2 3 4 5 ];
  samp = t - ((j(i)*Tb) - 1E-5);
endfunction

ST(t, Tb, 1);

% Cosine Function
function [cosfun] = Cosine(T, B)
  cosfun = cos(2*pi*B*T)./(1-(4*B*T).^2);
endfunction


% Data Amplitudes
Amp = [ 1 -1 -1 1 -1 ];

% Function Generation (Alpha = 0, .5, 1)
Pt0 = 0;
Pt5 = 0;
Pt1 = 0;

for n = 1: 5
Pt0 = Pt0 + Amp(n)*sinc(ST(t, Tb, n)*rb).*Cosine(ST(t, Tb, n), B0);
endfor

for n = 1: 5
Pt5 = Pt5 + Amp(n)*sinc(ST(t, Tb, n)*rb).*Cosine(ST(t, Tb, n), B5);
endfor

for n = 1: 5
Pt1 = Pt1 + Amp(n)*sinc(ST(t, Tb, n)*rb).*Cosine(ST(t, Tb, n), B1);
endfor

figure(1);
plot(t*1E6, Pt0, 'b', 'linewidth', 2, t*1E6, Pt5, 'r', 'linewidth', 2, t*1E6, Pt1, 'g', 'linewidth', 2);
title(' Wave Forms at Roll-Off Values 0, .5, and 1 ');
ylabel(' Amplitude (Volts) ');
xlabel(' Time (\musec) ');
legend('\alpha = 0', '\alpha = .5', '\alpha = 1');
grid on;

% Bit Error Probability Caluculation (Pb = Q(NM / sqrt(ANPr)) )
NM = [ .5 .5 .5; .34 .4 .46; .18 .28 .38; .014 .14 .28 ];
Pb = qfunc(NM / sqrt(.03))

