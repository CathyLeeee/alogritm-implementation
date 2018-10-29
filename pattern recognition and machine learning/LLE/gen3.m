% function          : gen3
% Project           : LLE
% Description       : 产生形状为3的流形
 

function [data] = gen3(N)

%% generate

rng default
z = linspace(0,4*pi,N);
x = -(2*cos(z) + rand(1,N));
y = -(2*sin(z) + rand(1,N));
data = [x;y;z];
end