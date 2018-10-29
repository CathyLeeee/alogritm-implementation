function [p]=func_px(x)
p=0.2*exp(((x+1)/1).^2/(-2))/sqrt(2*pi)+0.8*exp(((x-1)/1).^2/(-2))/sqrt(2*pi);
end