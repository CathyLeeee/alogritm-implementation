% function          : genN
% Project           : ISOMAP
% Description       : 产生N形状的流形


function [data] = genN(n)

%% generate
rng default; %set seed
N = zeros(3, n);
N(1, :) = rand(1, n);
N(2, :) =rand(1, n) ;
N(3, :) =sin(N(1, :) * 4 * pi- pi);

data = N;
end
